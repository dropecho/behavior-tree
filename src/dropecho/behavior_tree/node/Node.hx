package dropecho.behavior_tree.node;

import dropecho.behavior_tree.BehaviorTree.Blackboard;
import dropecho.behavior_tree.node.NODE_STATUS;

interface Node {
	public function init(context:Blackboard):Void;
	public function execute():NODE_STATUS;
}
