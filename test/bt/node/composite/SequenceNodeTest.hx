
package bt.node.composite;

import massive.munit.Assert;

import dropecho.behavior_tree.node.Node;
import dropecho.behavior_tree.node.NODE_STATUS;
import dropecho.behavior_tree.BehaviorTree.Blackboard;

import dropecho.behavior_tree.node.composite.SequenceNode;

class SequenceNodeTest {
	private var testNode : TestNode;
	private var node : SequenceNode;
	private var children : Array<Node>;

	@Before public function setup(){
		this.testNode = new TestNode();

		children = new Array<Node>();
		children.push(testNode);

		this.node = new SequenceNode(children);
		this.node.init(new Blackboard());
	}

	@Test public function when_execute_is_called_and_the_first_node_fails_it_should_not_call_the_second_node(){

		children.unshift(new TestNode(NODE_STATUS.FAILURE));

		//execute, and fail first.
		this.node.execute();

		//because the first fails, the sequence fails, so we should never call the test node
		this.node.execute();

		Assert.areEqual(0, testNode.executed);
	}

	@Test public function when_execute_is_called_and_all_children_return_success_all_children_should_be_called(){
		var tn2 = new TestNode();
		children.unshift(tn2);

		this.node.execute();
		this.node.execute();

		Assert.areEqual(1, tn2.executed);
		Assert.areEqual(1, testNode.executed);
	}

	@Test public function when_execute_is_called_and_the_end_of_the_list_of_children_is_reached_it_should_reset_the_child_list(){
		var tn2 = new TestNode();
		children.unshift(tn2);

		this.node.execute();
		this.node.execute();

		this.node.execute();
		this.node.execute();

		this.node.execute();
		this.node.execute();

		Assert.areEqual(3, tn2.executed);
		Assert.areEqual(3, testNode.executed);
	}

	@Test public function tree_should_init_root_node_with_context(){
		Assert.isNotNull(testNode.context);
	}
}
