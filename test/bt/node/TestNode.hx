package bt.node;

import dropecho.behavior_tree.node.Node;
import dropecho.behavior_tree.node.NODE_STATUS;
import dropecho.behavior_tree.BehaviorTree.Blackboard;

class TestNode implements Node {
	public var executed : Int = 0;
	public var context : Blackboard;
	public var execReturn : NODE_STATUS;

	public function new(?execReturn : NODE_STATUS){
		this.execReturn = execReturn != null ? execReturn : NODE_STATUS.SUCCESS;
	}

	public function init(context : Blackboard){
		this.context = context;
	}

	public function execute() : NODE_STATUS {
		this.executed++;
		return this.execReturn;
	}
}


