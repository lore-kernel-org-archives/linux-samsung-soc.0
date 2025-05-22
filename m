Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93728BAB4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919333; cv=none; b=Jz3KWjxJqen8Vr1533Qe++DrdzPkG2vFHx4ftSsQIOJ0SIAJBsOljXX9m9LJAE4ZwcoQbg4dY34w4+BvzVLTqsKV8MjQ1hsUPCm7I3imI+wf2lzieGSZpAhIOSw+jYR5tVuVOznJtIP/RP0z+LYHlLRqPOPo1gK1v3G1jfxtpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919333; c=relaxed/simple;
	bh=uh7703YZKKPJekStfl+iVLIVx/3sOB1pDpzQ2JGOUJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8dQa/zIqN8vkpK7LzuZJJDcjd7UhroHsyR9H8aTVjSjFZkbLDlojyU6Z0iOsM+9nVQFhzew5bY4FEdN/GRal0DW3vfSddHRsqZbpBXRDIgkoQAc0PKk+4Q//PU43waF0zo1VR08NUeZw8HA0u8FXV95ZhmNzuyxOc50w/e2eLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiXQUVad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiXQUVad"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8NV3t027725
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2025 13:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJi7j+M1RBOvHbcBZkRqK8/G
	si/9/J2x7eD+sSVq2/k=; b=TiXQUVadb2f2+r49UHjnhJBHHT+Lo6XN1ohK8ss5
	on5d4nEuWOlPeLqIQuBj2lcbLXfsGpl2mUdrMSK6jur/gfJsTXkouYM9OSrSZjOO
	J7EFKWLNKlrgnv1R6s3p05pm149eIbNJ5nn/a6i0Agi3DbTKxZsCZYTIQArzF0Ai
	piZn3Lt9wwrxuOsruegQu9OymBxFbSCJr4nJXMeGxUAn8pu0Gur3ip9Wm9aKB8O3
	kyofoeiyXsxICiPd29HRkGMjORN0zh/5sdQaqzrOb5FQ5lQxfsxA0g9b7EYc5mEE
	xtg6A3n8pgIqm9oSBMp9bAiT1sf/i1x+C24+xL7PtsufTA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9eb52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2025 13:08:50 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dc78d55321so40780385ab.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919327; x=1748524127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJi7j+M1RBOvHbcBZkRqK8/Gsi/9/J2x7eD+sSVq2/k=;
        b=TF0KgsrJMB8TLtm0XMuXBXi4P9Xj87dO1rlgT+qkHvFb1ItDXnYI1DZ6DpHuuR8umg
         aZdiMbrIxahvoc4ALJt4SZxeKRVNJVqQwfCDy0cyam1XWR7zY/vcFTftl0s+PLFoJj/5
         vEkXLvr0SF3HXjrDLSei+movCcP9O53zve66/Rw/DlTnSzPUfh/dnrlqcadM6lI0CJER
         kEBLTQ3AhbsXb0VgqN3J8os+YdqOIzu0sEMNYdUJs7fJAcBIil6t3qvGvDBcxw0zJrsu
         I3rlZ5v+Ar3YgzxQ5iNtFfqAReqsDjUsQU4R453uFPkuk3yjyPz2trspHipWzs5vbI0V
         lrHA==
X-Forwarded-Encrypted: i=1; AJvYcCVpSnXvjx5tfTxryaxWuIQFL+l4dCi5HV/u7sBDREjXsA70TXyZzvUhe2+te0RaCQ+9tSyVYa+OBqIRnrKvpqvtnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQnc/qsWWs4Yn4W4h5i8/Lm0Be8rFMzJsxwNifZunsI/XnFWz
	Fwm/NUURdGIkNSTRyXU1JPq0QLGDPjpP41iGSgJK8s3qSHKfa0jW3y2F6HVkNt0FoMAxo94Bq6i
	GcqoR/DVXDbDjwJHX44K0ZBCosSgb9CsXQdGZ8+ZUrmtNWaoLp8OvUn1NMcEyCAx+a8euredgJw
	==
X-Gm-Gg: ASbGncv9hOabBcNCT3Vy/IsLMv68h67Dl0Yk7u1Kf7uuiZKHgHMRkThAI0vm3M3epwx
	bfUEfdisv0efJBo44weGgRiJv/8McZE20bm7ngOM1Ho7ObtWLif4tQ5Z7VzP1Q4NZMkGdU7gzmR
	+1M5uNHk0LeWL4p1Go4laWYXwCfjS4zCWtYORugXeu0pEZdUKiu5u0msd/dLFTbfK7K52pRmPnY
	j8gnmizD90AWCR3Rv9U76bCuElVMTnmtetviNACNkkaWd89Hu7a0okbd+D8qB8s2UrTX0cVtS+4
	loUg8ZQ5Hxaf0/R3W9CeCNch6NR6it5kt9Y1i4NXaeyvvuJ+MX2o54YJfYWznKltgp4r5RE58ng
	=
X-Received: by 2002:a05:6e02:1489:b0:3d8:1d7c:e197 with SMTP id e9e14a558f8ab-3db842fe965mr263415065ab.7.1747919327119;
        Thu, 22 May 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvfUBsJCzHaG0IdypGYuFRgNGAJw7D+1sU0Oukz6Zh13k7pm8Eh33CZDVeTRmPagkRvVHBEg==
X-Received: by 2002:a05:6e02:1489:b0:3d8:1d7c:e197 with SMTP id e9e14a558f8ab-3db842fe965mr263414675ab.7.1747919326670;
        Thu, 22 May 2025 06:08:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702d5besm3391285e87.187.2025.05.22.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:08:45 -0700 (PDT)
Date: Thu, 22 May 2025 16:08:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <qkqyfksvimaks4wb4si72shewdc7ccy4n3srpkv3jf5snphepu@zpci2dquivhj>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
 <4yeqvg3wnlr2bhb54zutgqpkehrodat5w5x4rr5qjlrc2ts3pz@gr2iosycclpl>
 <20250512160201.7d0b21d8@booty>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512160201.7d0b21d8@booty>
X-Proofpoint-ORIG-GUID: wajmp2bSRGy4Rt_o1NbAEhQ7u8QP_bAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzNCBTYWx0ZWRfXwH5zxXKqwubK
 qFaGRlfVawWZ77wdNmo4tfX9JWGSSHryOyMWgXoIO4pWbz8LlGDLR7t+buqHQe7eC2/QyFpPGLw
 E+yYoBZSukl/4CG4yh4j4p5ZxE4YJpzoe1nLjLxhSz6cPNui33QfUsFuDXVofP/m9OuB6ME+dkA
 5Z9p/wpLm4rqETLqgfzUGRTRDgtNdn9d0PUJwvvD434c7N39Wt5q+zzTb/EVX24DO5ZVUouly0l
 +kZKvrOM8vmAAmjuBszU0fPBl4kzEULMj9DHIaRB+u22ckPIAjj3ohDrUMc2zJ5dLhSI0qBQDxC
 0dVj4vxnPo3UOLKC8S9Zw4YUNelsdgUiuk3xVISMCxjG3NsrX2NKFsDbL4A1JhGonocUQMIZvCq
 mv4anpShRg977XnquqDeVIY16xLqmrvMzRm5OJREjCMAuUaDDLn7fQ6VchnXbiW5kWE2MUSj
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f21e2 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8
 a=mfs67VCVHBiljQDpEFYA:9 a=CjuIK1q_8ugA:10 a=j7KN7tcCHpQA:10
 a=mHQ74H5e8mo-RpSg_uaF:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: wajmp2bSRGy4Rt_o1NbAEhQ7u8QP_bAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220134

On Mon, May 12, 2025 at 04:02:01PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
> 
> On Sat, 10 May 2025 10:43:04 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Thanks for looking at this series!
> 
> Unfortunately the exynos patch is still needing a decision. Quick recap
> of the story:
> 
>  1. patch was sent in v2, nobody acked/reviewed it [1]
>  2. was applied by mistake to drm-misc-next [2]
>  3. you pinged maintainers, no reply do far -> should be reverted [3]
>  4. Louis (fomys) asked on IRC how to handle it, no reply [4]
>  5. in this v3 I added a revert (patch 1), no acks/reviews on it [5]
> 
> [1] https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
> [2] https://lore.kernel.org/lkml/832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com/
> [3] https://lore.kernel.org/lkml/20250430-arrogant-marmoset-of-justice-92ced3@houat/
> [4] https://dri.freedesktop.org/~cbrill/dri-log/index.php?channel=dri-devel&highlight_names=&date=2025-05-07
> [5] https://lore.kernel.org/lkml/20250509-drm-bridge-convert-to-alloc-api-v3-1-b8bc1f16d7aa@bootlin.com/
> 
> What to do? Proposed plan:
> 
>  1. Louis immediately applies the revert (patch 1)

I can't help but notice that both Louis and you have bootlin.com email
addresses. Granted the lack of responses, can't you ping him internally?

>  2. I send v4 with the original patch to hopefully be reviewed/acked
> 
> Plan is OK?
> 
> I'm assuming Louis doesn't need an Acked/Reviewed-by for that, but I might
> be wrong, and we both would like to avoid further mess.
> 
> This annoying issue is taking much more effort to be fixed than it took
> to develop it. I'd like to get past it and think about the next steps
> in bridge lifetime management.
> 
> Thanks for your understanding.
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
