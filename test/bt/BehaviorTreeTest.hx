package bt;

import massive.munit.Assert;
import dropecho.behavior_tree.node.Node;
import dropecho.behavior_tree.node.NODE_STATUS;
import dropecho.behavior_tree.BehaviorTree;
import bt.node.TestNode;

class BehaviorTreeTest {
	private var testNode:TestNode;
	private var tree:BehaviorTree;

	@Before public function setup() {
		this.testNode = new TestNode();
		this.tree = new BehaviorTree(this.testNode);
		this.tree.init(new Blackboard());
	}

	@Test public function when_execute_is_called_on_the_tree_it_should_execute_the_root_node() {
		this.tree.execute();

		Assert.areEqual(1, testNode.executed);
	}

	@Test public function tree_should_init_root_node_with_context() {
		Assert.isNotNull(testNode.context);
	}
}
