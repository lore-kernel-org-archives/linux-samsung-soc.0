Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h05tS6rv"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F61171C;
	Fri,  8 Dec 2023 04:31:10 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B89XoA9019652;
	Fri, 8 Dec 2023 06:30:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=j+2XwUlydBldoH5
	/z4UMlrqVMClGOaVTyXeRxtmr6h8=; b=h05tS6rv+XHpxKvuR5chxWvttrLVqV1
	DHY/O2JVMvVqisC4AtePQEv/kQynnr7N4W0J5vjZDzur98MUSqhRH9QbK4ooHb3K
	/HcsDgoLl+BFjb3jcO+jnk5tmvEVdVpZeXDWn0mjbdjAdIlE8fbdxi+jCW/+k6Lc
	lmq6Ty8lic2VyL3q5VN+hM/7emfRcAuAYl/UetmHoD4oN4VIa2fRxXMQiScBqES4
	SBIhP4kFipqUNoidey7DMGfUo29hziE5Qqhzz1OjRNU8hVxPVeIFDsJ6QK8EBhZ8
	ZjD6VY4i4JuHSMPw5XSj9czsRQHASMJiSfLUJSBT6SLTKk6YVv989NQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47ug6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:30:41 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 12:30:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Fri, 8 Dec 2023 12:30:35 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 49F6146C;
	Fri,  8 Dec 2023 12:30:35 +0000 (UTC)
Date: Fri, 8 Dec 2023 12:30:35 +0000
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
Subject: Re: [PATCH 1/5] ASoC: wm0010: Convert to GPIO descriptors
Message-ID: <20231208123035.GP14858@ediswmail.ad.cirrus.com>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
 <20231208-descriptors-sound-wlf-v1-1-c4dab6f521ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208-descriptors-sound-wlf-v1-1-c4dab6f521ec@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: -XIozRvkI0tkhUC_3Y4fi80H0yhMADgb
X-Proofpoint-ORIG-GUID: -XIozRvkI0tkhUC_3Y4fi80H0yhMADgb
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 08, 2023 at 11:09:25AM +0100, Linus Walleij wrote:
> This converts the WM0010 codec to use GPIO descriptors.
> It's a pretty straight-forward conversion also switching over
> the single in-tree user in the S3C Cragganmore module
> for S3C 6410.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
