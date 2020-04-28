package bt.node.composite;

import massive.munit.Assert;
import dropecho.behavior_tree.node.Node;
import dropecho.behavior_tree.node.NODE_STATUS;
import bt.node.TestNode;
import dropecho.behavior_tree.node.composite.SelectorNode;
import dropecho.behavior_tree.BehaviorTree.Blackboard;

class SelectorNodeTest {
	private var testNode:TestNode;
	private var node:SelectorNode;

	@Before public function setup() {
		this.testNode = new TestNode();

		var children = new Array<Node>();
		children.push(new TestNode(NODE_STATUS.FAILURE));
		children.push(testNode);

		this.node = new SelectorNode(children);
		this.node.init(new Blackboard());
	}

	@Test public function when_execute_is_called_it_should_execute_the_children() {
		// execute, and fail first.
		this.node.execute();

		// second execution should run the this.testNode;
		this.node.execute();

		Assert.areEqual(1, testNode.executed);
	}

	@Test public function when_execute_is_called_and_we_hit_the_end_of_the_list_it_should_reset() {
		// execute, and fail first.
		this.node.execute();

		// second execution should run the this.testNode;
		this.node.execute();

		// this third call should execute the first node again, since it should have reset the internal counter.
		this.node.execute();
		this.node.execute();

		Assert.areEqual(2, testNode.executed);
	}

	@Test public function tree_should_init_root_node_with_context() {
		Assert.isNotNull(testNode.context);
	}
}
