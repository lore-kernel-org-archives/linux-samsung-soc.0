Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E325C6E2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264579; cv=none; b=R1tdgn/hdXQqw8y3PBIbvKQdDCIk+1Px0Zm12hURFJIeISv6oUGpfuiCeUBaVAx4jSmE5+iDSfYJUTqh3WzQYXHVfDosl97BmEEKCYsHtGS8xFBHPbNwFO2fg0afF+M+/2Li2/6GhVuQgTSUHu72AOMCVodMXIXHLdfuNOTY+8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264579; c=relaxed/simple;
	bh=pYzmZMeM0haV1I7kxC+a5XtONgUKhG80+mi59Gbz8bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkgzor2/0T+hde8DifpJFhvQDt3ih7cJ4mRS2HovMACZ+2oWzhz60oPRq3xFWYFbCx5jrtHlr+ihdJXjZFjhi19Da4YB/Bplhq129qJSEas/YC8wPBl3XjB5/v6bLg3TCcqdKMfy0gnfDM8NeTZLHErhBnKmEOZ3dWMvS8mprXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYaUOS+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYaUOS+V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UJIdm3017821
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yRYR8mKHUZFaYtXuWtiKtjrk
	y868kXbSvHpGdSOUABY=; b=aYaUOS+VDv+kxGuS0EJOBn3jZsRvgFGBxtozbsMR
	Ac9vrucmrZxwlJT/bwVES0C71Pifkfd7jEhfBwDX8PcD1l+BQYW94SrM/q2VQYFW
	DSfhw+ZrjsVgjnjN/gMX7X9pHlZBAnLC3pmHy6IGvzJ7/kW1NQ3nkMSWJJZNaB5Y
	fqwcbk6Vrrulg2sTCgxyVF1pVKVHnRxqEWiY6/V6mgv48P3LGjUP3xBoVnS0bCFE
	J/FQSPRuSa+6FvqfGXqEGpQVYAki1/LYqW1e3mKgBLGbDe3SGHhm9zt334YhoCu6
	nz5g1QtR41tllKQaQNXpN4HQjHYEMTJQgrL4TMs19jbcUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tths4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:36:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e0e7caf22eso78931851cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 13:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264575; x=1759869375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRYR8mKHUZFaYtXuWtiKtjrky868kXbSvHpGdSOUABY=;
        b=kmAppO1K+8xO4hEbs7obsd521Jvjb3UvUNRiJ/iOeY9Iq80g547RJPpd/WZZFAByCa
         EBz4GUYZwccfHUOA5bj9MiF3h8d21r2S/2XWQCXEYZcv0E21AyK9lC5wQoJ3nesIFWg8
         P3WBKTUeJWZIN4DFmXOttLfHi1w6PwYj9CT1jlDLIRXqE6aAI6NZHCD66+CTZG0E0OMw
         nZ4puQSe+kqZZN8An3vLkQJuyNQpjK6SRAc9ni3R15L1GCNgbTKVI5/cg5s+5KAQFIqt
         lJqsnCDRzxALrQrkgwalSix2dSINqNU+pk3EI+QA2O4ByK7LBwyN6AA7rZneKnJ1/Dbf
         8NEA==
X-Forwarded-Encrypted: i=1; AJvYcCXEdrWV1+3RS/t/sj9d5Uc1hfTNx6e0zZKqhV4gu9804Da8T3aaR10PtoLkTHsQ5X9P0FeaKmYnDlcIWlLhDEErBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRZgeWy67KT7F0Vb9ZGQlcgqMWTB4Hx7SONgW57MOOum11d0/
	7ffX6cHQxX36KefB5tqYjwqwL44eRq4+Tqe7z6HFDKUl1EH0BwE+RGNgtSlUSqgB48v5nvuwGK9
	lCytqPkNPdufsTs6K0DPE+8wbEQfHhW+4E1mq3CC8OkPAgqnio05B7U7Z4tMTAP/GeIMS/jHVpA
	==
X-Gm-Gg: ASbGncuMSPiOHkKvSmXwNBvbD8Jkf3emquCiUrDEty5WSopVqdoadPRfHh2jTVFp6dP
	34qCcANMC1ReK3U59YOVxS30ZCCjHM83jMgeP0nzdM5XJzTwFBzMG5yEDsyy0TswbNo6u4a8tum
	x7RAnzUXvypYX1PXVPkApM81PJRtCGN/4L4RwRn8H1C2VR+/u0+0i2cZ0SOgd4rJtMmfor+92OV
	03VB2LL3Uii0rA60LNKgQw+rtrubNmhHRqRtgDXgtaaGP6qlRHpp+nkDWrQhuBhXE2b3uMFDumP
	+hiWKz0xiR/OroqJ2wYjCGCXYalNtmwr2M3od3qHVFsrreoTx/ziIWuUQW69vAFRkGa8Odi/M7/
	Tj3gZd5o54E8795CGDybARfRoLqM+XKCuGILsMQyobqDeN/9nx/FteSi9qg==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4e41e2553a4mr14266781cf.61.1759264575281;
        Tue, 30 Sep 2025 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFuPPlCXIV5zyuzMgVAJcVfckSn/45lViJoli6ItFTToo3aAOYLqDps3QFpjsl6dnCqLcS/g==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4e41e2553a4mr14266301cf.61.1759264574813;
        Tue, 30 Sep 2025 13:36:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710474sm34821171fa.33.2025.09.30.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:36:13 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:36:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 18/18] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <aeby4ds46ehzkrvc32pjcrxz2aalpc7icuis4y4zxfm5kvgcg4@ie7m7s6rcnqu>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-5-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX/Jtc4HCPaa+S
 E+3MPqE9CeS117WMFaemgIlDpWiMGTuqP51e+y9j0tOWbxdODdEcTsFzk1MnMcg8AiT3Z6f7kLA
 PFTcfp340e/0NNjv/Xlpb5sGRtPmNJFyMxqLkZMdsLhbU0zegvcHASXKv3AAIakYDrG6PMViawr
 hTibbX8aMj8RIILsjSNMnGNo3BANCQj2TVMzvrTzb/9UZW4Dceb1mVj+05kYJha3CQRFEvQO9vF
 OGzGLtCYadUlsucjXixciYz9a3X/5BFW+vkv0U2u1yPREh3zHDvvNA50nN3sVxLeT+tulsprTwS
 SsW19Ez55UbU4iqR7TrgYA+2vs7Az1QTqdfnaKJcHDZ08AU9pTzQCnp7lk8ZhKt0FdL67/50hZN
 G1uImlg5uj5fksYZ96YurKpDLjGHVQ==
X-Proofpoint-GUID: 1ubDK3XFxRrgpy5ZwPFt4Cx_1mMy3rh0
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc3f40 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=rSdC-L6FqKhTve90478A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 1ubDK3XFxRrgpy5ZwPFt4Cx_1mMy3rh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Tue, Sep 30, 2025 at 05:42:51PM +0800, Damon Ding wrote:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
> 
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Remove the unnecessary analogix_dp_bridge_get_modes().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
