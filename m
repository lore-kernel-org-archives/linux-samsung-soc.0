From: Michael McConville <mmcco@mykolab.com>
Subject: ^= usage
Date: Mon, 7 Dec 2015 23:10:38 -0500
Message-ID: <20151208041038.GA15636@thinkpad.swarthmore.edu>
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx01.mykolab.com ([95.128.36.1]:62187 "EHLO
	mx-out03.mykolab.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932469AbbLHEKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 23:10:44 -0500
Received: from mx04.mykolab.com (mx04.mykolab.com [10.20.7.102])
	by mx-out03.mykolab.com (Postfix) with ESMTPS id 47F25201D9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Dec 2015 05:10:41 +0100 (CET)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Just a minor simplification.

Signed-off-by: Michael McConville <mmcco@mykolab.com>

---

--- sound/soc/samsung/i2s.c.orig	Mon Oct  5 21:39:03 2015
+++ sound/soc/samsung/i2s.c	Mon Dec  7 23:04:02 2015
@@ -623,10 +623,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
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
