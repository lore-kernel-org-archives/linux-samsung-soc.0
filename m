Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CeC2pGBx"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B89199B;
	Fri,  8 Dec 2023 04:47:54 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B88jsDT000384;
	Fri, 8 Dec 2023 06:47:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=4EfBCsZwpPfpsu4
	IecL/XagjEsPKxZfP/UyMakdxZWg=; b=CeC2pGBxDVPCZ+l7XwsWE8nRWNK8F0y
	8mOtVs21/fTmCeOi8CSJBuDnB+or9BgXs58i8grSW9QntCwcJCpcWpiTGM542ES+
	B5G41gsEZFSXFuLvOBY+5vOmqh7EE7xpckZtnCNi7FwiB90UJNaZGd9D6JUY4B+X
	aTgVARM0hbOqh9sdTfzzYpMouztV0YtMc5xJc/87ULv6jOl0Q7HdjbTU9WtFFsMI
	psLLbqj10p5clJ2X0cjK448s4v5WqTr8OeGH6L4j48Ow2WhI7yVmqkaUqT15/LRn
	Kt+LrPrcssQuzvBPO7UAm7voHoQ0nSUaPsBvsh+jz7thmCHzXD3Ly8g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47ugkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:47:37 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 12:47:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Fri, 8 Dec 2023 12:47:34 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D928C46C;
	Fri,  8 Dec 2023 12:47:34 +0000 (UTC)
Date: Fri, 8 Dec 2023 12:47:34 +0000
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
Subject: Re: [PATCH 4/5] ASoC: wm5100: Convert to GPIO descriptors
Message-ID: <20231208124734.GS14858@ediswmail.ad.cirrus.com>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
 <20231208-descriptors-sound-wlf-v1-4-c4dab6f521ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208-descriptors-sound-wlf-v1-4-c4dab6f521ec@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: I686R4D5mVmdEJ9FDaG1NktlWiPLNj47
X-Proofpoint-ORIG-GUID: I686R4D5mVmdEJ9FDaG1NktlWiPLNj47
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 08, 2023 at 11:09:28AM +0100, Linus Walleij wrote:
> This converts the WM5100 codec to use GPIO descriptors, a pretty
> straight-forward conversion with the following peculiarities:
> 
> - The driver is instantiating a GPIO chip named wm5100, and the
>   headphone polarity detection GPIO is lifted from there. We add
>   this to the GPIO descriptor table as well, and we can then get
>   rid of also the base address for the GPIO chip from the
>   platform data and just use dynamic numbering.
> 
> - Fix up the only in-tree user which is the Cragganmore 6410
>   module.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
