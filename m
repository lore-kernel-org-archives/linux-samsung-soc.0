Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h56cuFtH"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE30010FC;
	Fri,  8 Dec 2023 04:51:08 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B86wegd017155;
	Fri, 8 Dec 2023 06:50:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=cJSQitBydPxYIQ7
	jqTifHGmQyvsAG0n9yCq2THT5jbA=; b=h56cuFtH92U/7jgt7xubieTLpK1sH4N
	dRnWGW9u6TzGatclrah0NhcoUz9ytio+HJ599cijmwBXdgzMFpCm/zn+jzOVpOcK
	DgaU6kkj0knokCZU+hLyXB+JA0yvNa22AQK/Jxlt5vVbtIq9118gKjRcKycYNs+B
	Rnjb1fpcctgX3iDHAkcECevHaIur4ay9u/lfbQT/00oAxRIYFSCLNGKA3Lk6FKeo
	oHYrFVLkvWgOi/vDk7QLye3NENVklgaUnHHZxGtuyYWCiU8l5X2VFJWgzHyALgwV
	JVd2lysfcaCyuKbq2gR1hoQuOB4bg1r3+j2KZ98Pa1kRcFGl/BtrXIQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47ugpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:50:53 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 12:50:51 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 8 Dec 2023 12:50:51 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4445111D4;
	Fri,  8 Dec 2023 12:50:51 +0000 (UTC)
Date: Fri, 8 Dec 2023 12:50:51 +0000
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
Subject: Re: [PATCH 5/5] ASoC: wm8996: Convert to GPIO descriptors
Message-ID: <20231208125051.GU14858@ediswmail.ad.cirrus.com>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
 <20231208-descriptors-sound-wlf-v1-5-c4dab6f521ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208-descriptors-sound-wlf-v1-5-c4dab6f521ec@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Ig7KnDN_IlU3LTcsxyyclzAZiH_OGI8s
X-Proofpoint-ORIG-GUID: Ig7KnDN_IlU3LTcsxyyclzAZiH_OGI8s
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 08, 2023 at 11:09:29AM +0100, Linus Walleij wrote:
> This converts the WM8996 codec to use GPIO descriptors, an a similar
> way to WM5100.
> 
> The driver is instantiating a GPIO chip named wm8996, and we get
> rid of the base address for the GPIO chip from the platform data and
> just use dynamic numbering. Move base and ngpio into the static
> gpio_chip template.
> 
> Fix up the only in-tree user which is the Cragganmore 6410 module.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
