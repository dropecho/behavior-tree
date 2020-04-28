package bt.node.decorator;

import massive.munit.Assert;

import dropecho.behavior_tree.node.Node;
import dropecho.behavior_tree.node.NODE_STATUS;
import bt.node.TestNode;

import dropecho.behavior_tree.node.decorator.RepeaterNode;

class RepeaterNodeTest {

	@Test public function when_execute_is_called_and_the_child_node_is_failing_it_should_return_running(){
		var node = new RepeaterNode(new TestNode(NODE_STATUS.FAILURE));
		var status = node.execute();
		Assert.areEqual(NODE_STATUS.RUNNING, status);
	}

	@Test public function when_execute_is_called_and_the_child_node_is_successful_it_should_return_running(){
		var node = new RepeaterNode(new TestNode(NODE_STATUS.SUCCESS));
		var status = node.execute();
		Assert.areEqual(NODE_STATUS.RUNNING, status);
	}

	@Test public function when_execute_is_called_and_the_child_node_is_running_it_should_return_running(){
		var node = new RepeaterNode(new TestNode(NODE_STATUS.RUNNING));
		var status = node.execute();
		Assert.areEqual(NODE_STATUS.RUNNING, status);
	}

}
