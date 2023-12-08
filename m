Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZJe3/kTl"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB31510CF;
	Fri,  8 Dec 2023 04:45:59 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B86fAWh032255;
	Fri, 8 Dec 2023 06:45:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=lY3+rNQA9URkfIl
	KmBGo6PBv+Bs67y8jiI1X8VyKI30=; b=ZJe3/kTlCKO0BYMEdCCe49keCZwM3SE
	z/V4j0N68sJJYfFOkuVi7pTRPobUaXdj7VaZv33iidelmPOhZaU9Zs4KRGnFbsFA
	eUVnnCwVr4OJZZfsvnB2k7WxLnvGcALYjckNfrlSr/KJ6PQuulztIk+i6Mam01eu
	6Wi1TpgZUt/lZ9nzVQfZM9kahBd2OiL3Z99G1/5wzaz0vSaDhXG0c7rfp/g8OAvn
	TiCJxlu92aucJqeTIiCt6eE9ibse950vesCM5FLXIyJ318nzRAUEZQtVAPWsyWx1
	BEhigpmV9ZlHHPYDbmD+cEC1Ea9XVQAuLUDEc/PAPf6pVrRKj0Hdx3g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47ugjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:45:45 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 12:45:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 8 Dec 2023 12:45:42 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C9A94468;
	Fri,  8 Dec 2023 12:45:42 +0000 (UTC)
Date: Fri, 8 Dec 2023 12:45:42 +0000
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
Subject: Re: [PATCH 3/5] ASoC: wm2200: Convert to GPIO descriptors
Message-ID: <20231208124542.GR14858@ediswmail.ad.cirrus.com>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
 <20231208-descriptors-sound-wlf-v1-3-c4dab6f521ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208-descriptors-sound-wlf-v1-3-c4dab6f521ec@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 65HOiqiWED-T8UsHbpBZw9EolyDob1gE
X-Proofpoint-ORIG-GUID: 65HOiqiWED-T8UsHbpBZw9EolyDob1gE
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 08, 2023 at 11:09:27AM +0100, Linus Walleij wrote:
> This converts the WM2200 codec to use GPIO descriptors.
> This is a pretty straight-forward conversion, and it also
> switches over the single in-tree user in the S3C
> Cragganmore module for S3C 6410.
> 
> This coded does not seem to get selected or be selectable
> through Kconfig, I had to hack another soundcard Kconfig
> entry to select it for compile tests.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
