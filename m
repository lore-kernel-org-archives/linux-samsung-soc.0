From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] ASoC: samsung: Minor simplification in i2s_set_fmt()
Date: Mon, 10 Oct 2016 04:04:05 +0200
Message-ID: <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34808 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751986AbcJJCES (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 9 Oct 2016 22:04:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: krzk@kernel.org, s.nawrocki@samsung.com, Michael McConville <mmcco@mykolab.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Michael McConville <mmcco@mykolab.com>

We can replace the if-statement with the simpler bit
toggle operation.

Changes in v2:
- add proper commit header and description

Signed-off-by: Michael McConville <mmcco@mykolab.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 sound/soc/samsung/i2s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 50635ee..1c484ac 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -627,10 +627,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_NB_NF:
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
-		if (tmp & lrp_rlow)
-			tmp &= ~lrp_rlow;
-		else
-			tmp |= lrp_rlow;
+		tmp ^= lrp_rlow;
 		break;
 	default:
 		dev_err(&i2s->pdev->dev, "Polarity not supported\n");
-- 
2.7.3
