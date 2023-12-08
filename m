Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hgSCzXbu"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7900171D;
	Fri,  8 Dec 2023 04:49:12 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B8CTuCC015541;
	Fri, 8 Dec 2023 06:48:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=+GmJWoYLo0rTdRF
	h5rejQDyps/mnlbWQ0KCFXKsnw0o=; b=hgSCzXbuby+7r+KHDAGE3ZfitrBZz0h
	jmpwDrGC3u1S+eY+vXCH/8qgX6FjjnDaNn3KrOomgc4hPgVox2yhO2nU6JmLkyx/
	ESUuyj4J8vD3dN85CpV/bwS6Vlf4LpdBQG4O5ZQAsGARkES/vPhcOUfUkKREB+dB
	LmkllTFTw+1jpLHHBv42uLwFEYPYjTwPVCCBu45oRKhkWtJO5dmL3sMCrGv//tj0
	9eGlP51qHVsXPjAcnF5iyoMgiw6gAURZXveHwjrek9Uks2UGkLSRIWNrRrvB9C6E
	KUuyamynWFc48Q/8lD+8n8Ul6F6Sqay/zagRhqImGp77A+evqxK4zjg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1wbg4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:48:56 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 12:48:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Fri, 8 Dec 2023 12:48:47 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0E30E468;
	Fri,  8 Dec 2023 12:48:47 +0000 (UTC)
Date: Fri, 8 Dec 2023 12:48:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 2/5] ASoC: wm1250-ev1: Convert to GPIO descriptors
Message-ID: <20231208124847.GT14858@ediswmail.ad.cirrus.com>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
 <20231208-descriptors-sound-wlf-v1-2-c4dab6f521ec@linaro.org>
 <20231208124257.GQ14858@ediswmail.ad.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208124257.GQ14858@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: wh0teOOd6Eixcs1KR2pDztjUNPXPEc6K
X-Proofpoint-ORIG-GUID: wh0teOOd6Eixcs1KR2pDztjUNPXPEc6K
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 08, 2023 at 12:42:57PM +0000, Charles Keepax wrote:
> On Fri, Dec 08, 2023 at 11:09:26AM +0100, Linus Walleij wrote:
> > This converts the WM1250-EV1 codec to use GPIO descriptors.
> > It turns out that the platform data was only used to pass some
> > global GPIO numbers from a board file, so we get rid of this
> > and also switch over the single in-tree user in the S3C
> > Cragganmore module for S3C 6410.
> > 
> > The driver obtains two GPIO lines named OSR and master and just
> > pull them low, we leave this behaviour as it was.
> > 
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > +	.table = {
> > +		GPIO_LOOKUP("GPION", 12, "clk-ena", GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP("GPIOL", 12, "clk-sel0", GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP("GPIOL", 13, "clk-sel1", GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP("GPIOL", 14, "osr", GPIO_ACTIVE_HIGH),
> > +		GPIO_LOOKUP("GPIOL", 8, "master", GPIO_ACTIVE_HIGH),
> > +		{ },
> 
> For my curiousity, what is the significance of GPION vs GPIOL here?
> 

oops nvm I see it.

Thanks,
Charles
