Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D541235BE1
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753531446; cv=none; b=N0U797L+RcxhR2HBj9VUy5ul97yhziD4D3tqG4AQsuGwxQPUbdEVssZkD3Fko3NaARr/ZAqkY7uQxJHW3XP7DgqOtS+IlgHnMUhTRTqHOMzmkgn92uN2X8lNTwN/FDQew5F9oXFM0I7s+t9o8zeGSrXJ+7Zer7s61cXU1wCak6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753531446; c=relaxed/simple;
	bh=SUqmgY85eJXAlsObLamKQHNIuUnUl+Ry5O/dMG3DM0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idgRiQMMj26JSA8SyNq26DydLSnTLteCqw+IGkUI3ZIOT0ypcRDjZ9wF3bHJS3hlb06P5KRBgmsVNglbFfLIpPArWJFUG6eri3ckmzjSi3R/66QsQRtcjMhWRv2VRe1BWoCyrG5Txk6UxtOqWkCWhcspM9pzy/0UrhyMwjIZNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uic5+gBJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uic5+gBJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3VtBI009325
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VoyOpXRtg8gribBcwI2od48J
	idopHaqstqRQI8GRAvQ=; b=Uic5+gBJ9Cg+damRxJqNwUobzHWxb0WUFthMrxQ5
	82CAhudDKkbCP1zzrv/qSse5/vBH405bLWg/Zt5Z/h2L7RgyrDAO/2dJi4Upups1
	23cW9WrrbUVAiVKjQOd8HXVmMdEJNZkKlTZGXc1Ze5GqNdNhRFFuIwHUcXJnxB01
	CSDLSBgXOZA2skOgtyuOOgv2F9Pb3wNWpaTcLA6j0dINwirELFTURIs8MVIPmcXB
	LGSuTAzFxblbw9a4VNTarVC32W1p2HUdmCrW7Sg6a9toI4PQZicsjHYyaVa0iuI3
	onYYM6JuMSpfi56WDDAtDVSfogo/7h3X969T26iYpa9aRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrnnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:04:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f71b363so62068746d6.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 05:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753531443; x=1754136243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoyOpXRtg8gribBcwI2od48JidopHaqstqRQI8GRAvQ=;
        b=IGXmBT6ksyRFtq8uEqz7B3WgyD4DLjk3u6lhetPzBh1YJguXKf9UDWlXtSF5LGDHtE
         oy6DFLLSzKPSMcNJOld4+w4keYCCXC/a66juJwnkU2nr2ro4n55vRgEnbsmljMAuhn/A
         947EtinPiJVi0MIXJwqFOLuVBX+raLomollQ6iGrYiYSUUHvS5MOa/p3czEsTeBPQSQu
         uMd8krhX8ELAGeVwalYSCv9jqcIGt+C/2f4bvlPlPeF6OYZ4sMkAMHRESCv7PfVXWGVv
         yWmyq1PBL1UZcLFo77MD7mJ7+HxlEpp7u6Jxu4ANhVke4IxY2T3ZK3Yt0bqpxltpnCM9
         n+qA==
X-Forwarded-Encrypted: i=1; AJvYcCUUEpiiCFH0/iTnDTyCtthwRR/Bs41xEXRSK9KcY5C1ielm1UGh+jf1aInyQZ67OG/2uwyXuhswGOmTjUDfbY7UaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7GCBn4CPXG4OCIAhckQzro2ssIgqyzs7g/7zZO/YPV5BBnyGm
	NVcxOpLKs2aGkdxGu1Yke6lTg0cXWYrLcC+44pwrw6SB4pGAxsTRmsdK9YGUgneIi2jo2nrnLZL
	TtWbkTmTn3OdGbXMYSh+cXLmdyq1ct3HLpalJiZ18zBsBADuEcNWMayvCgRYx3xWRoQJMiLfm7w
	==
X-Gm-Gg: ASbGncvHUQKlhk2ycUqZ0TGdl7/FJbvCEJEFRVlS4X/x1eH7Ge1DlvymmN/nr7CKm4t
	GRJQ6XPtZ5XTAVB5lNSFJosIQN56pRTJoNX0Kcl+rQUUg1dyIeAoy73rr9zfCWJvtsu25rbgj0U
	PbxLrkG8mG8XMym21MGRHpc2nWWZyYw5bSKWhZxkucH0iSEjKbe9qgWvCqJoA7PoFvktUmdNAHG
	SCOQcia0aRUFMQCcfL31j3egrmyCH+Et5vc7HG1pmymlNGP4gcSO4tJ2SPaVLt3JjL6uFjAzAT1
	NFTJbNQfrP6NSscx7AK2Bt4h1zyHbrspzXVl+R8mCyJQeSGeZyFw0ii1DBXhsrBsuR9mxSaeKaC
	nnAmzEYyEygoGqXX3Kf/4T5QwyX4qpY3+8maK5+9jO28XlKFViwIB
X-Received: by 2002:a05:6214:21e9:b0:707:2c79:e7d4 with SMTP id 6a1803df08f44-7072c79f177mr39705196d6.7.1753531442345;
        Sat, 26 Jul 2025 05:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE58ci26k7CLxO9KIg2k91tBSPq0VEHMytUV57ob5dO9j8+ZCHVsrHrzcPy3gVkj6+ng5cHLw==
X-Received: by 2002:a05:6214:21e9:b0:707:2c79:e7d4 with SMTP id 6a1803df08f44-7072c79f177mr39704146d6.7.1753531441626;
        Sat, 26 Jul 2025 05:04:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d924sm413275e87.43.2025.07.26.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 05:03:59 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 10/14] drm/rockchip: analogix_dp: Apply
 analogix_dp_find_panel_or_bridge()
Message-ID: <c3a7fptnm7vxpcz3ouzyov2woi4btknb2so7np6z4iq4anyodp@ajgkwlc4khga>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-11-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-11-damon.ding@rock-chips.com>
X-Proofpoint-GUID: CRDW4RXDHfEajceWsDAFTiz9MtxQ6KC_
X-Proofpoint-ORIG-GUID: CRDW4RXDHfEajceWsDAFTiz9MtxQ6KC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX4U8AciRseXaS
 nTA0MtKpIITOUDtYFHGxBb2izZUY5ZgDgJrzov/BXqYFD/JJ66nPpUArEFAf80mX6JuLcGz/gep
 fr3ygSC38vdlTYe2Cs/zfqnlEUwImlVT0yAU9cEK+PyTQ/GTX6/JM1nfWWgfvT9VmGhOaliseyO
 ndBC1KGsgfA1a3Pg8w4+NXgyRTK5h+jT8/Ucw/uUrajxsLpJ5LvGTK+uLQ0osl6HaDftgjdW45Q
 rbuiRaxUHFGPnrJHznBVrUmfxveLgPi0X8X8+IXiH8ur+gKsLrLA2G013VLD4TQ0KPTdb3YhsIx
 VsOKTbF2D8IGmbfwXecd5jzfq+zBi8g8fiPTR42n0dHI1QRSJUjTiacR0lR1W3XK32d+EV3qGbd
 bFp3Kl/bdPpgCsacS5Ws2Z8eOt/fZ61vDLyLQvxRwzAaWU+rzeQrX8UfIb9U99JFTM07zxxn
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884c434 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=23ZsHGXRUfRepE-eGp0A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=687 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104

On Thu, Jul 24, 2025 at 04:03:00PM +0800, Damon Ding wrote:
> Apply analogix_dp_find_panel_or_bridge() in order to move the
> panel/bridge parsing from Rockchip side to the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
>  1 file changed, 2 insertions(+), 36 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
