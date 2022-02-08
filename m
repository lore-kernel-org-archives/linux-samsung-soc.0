Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CF0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 14:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359762AbiBHOdd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 09:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiBHOdc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 09:33:32 -0500
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7117C03FECE;
        Tue,  8 Feb 2022 06:33:31 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2185vPfv010879;
        Tue, 8 Feb 2022 08:33:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=cWmRZJ9l9YFQIc1Fm+9i8vDwxVG2Ie8vz9peJbtegXc=;
 b=hWEGNNGe2hwhhil2O3/I5vDsUNHBt4UHwCAdfd6rbwV6Z7dgGgOxNPo5kq1teDF/IcuH
 FC2j6wCTZ+kPwkdSa3z5hw+CcyRpVrOf7eHGWuGyVAmoGDFb8AxPM9MnIJEpXa0qU8P7
 wLfF7lSt7OXg32tLNYMoJGwvPzEb1kI46Ya4QYJ+PYgIag0pSty/i04EpHeRB2XTjRzC
 BIOux+mju6Jb4AdXKgE1xLGcsXwXINQEzfny+6SRsKJV9Fw1GfiYUrD46EqbC6v6mF8k
 gB/WYd3H1SkntNkrHL+3C10dDQSoxxMrn6zxwdIqh6Ym3ps0t+ce8hZzHD+R654LcCWm 9A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e34y5se74-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 08 Feb 2022 08:33:18 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 14:33:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 8 Feb 2022 14:33:16 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6DE902A9;
        Tue,  8 Feb 2022 14:33:16 +0000 (UTC)
Date:   Tue, 8 Feb 2022 14:33:16 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2] regmap-irq: Use regmap_irq_update_bits instead of
 regmap_write
Message-ID: <20220208143316.GE112838@ediswmail.ad.cirrus.com>
References: <20220119142953.1804-1-quic_pkumpatl@quicinc.com>
 <CGME20220208122955eucas1p2d4e32f51224242e9ebd0bce58b9c04ca@eucas1p2.samsung.com>
 <39f1b598-58ca-1e3d-3065-8dd692ee7c9f@samsung.com>
 <20220208133957.GC112838@ediswmail.ad.cirrus.com>
 <20220208135036.GD112838@ediswmail.ad.cirrus.com>
 <YgJ2hG2vwUclA/zF@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YgJ2hG2vwUclA/zF@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: _3Pt0-93aRLbNEUGyU3aJYTgON3x3QWo
X-Proofpoint-ORIG-GUID: _3Pt0-93aRLbNEUGyU3aJYTgON3x3QWo
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 08, 2022 at 01:56:20PM +0000, Mark Brown wrote:
> On Tue, Feb 08, 2022 at 01:50:36PM +0000, Charles Keepax wrote:
> > The update_bits is really problematic as even in the write 0 to
> > clear case, if a new interrupt asserts between the regmap_read
> > and regmap_write that make up the update_bits, you will clear that
> > new interrupt without ever noticing it.
> 
> My understanding was that they'd mixed interrupt handling in as a
> bitfield in another register.

Eek.. what a courageous choice. I guess that might work as
long as there is only a single IRQ status bit in the register,
if there are multiple bits this really needs more complex
handling, like you basically need the old behaviour for the
IRQ part of the register, and the new behaviour for the not
IRQ part of the register. So perhaps a new mask to denote which
bit of the register is being used for IRQ stuff?

Thanks,
Charles
