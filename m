Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFEBE5E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488925; cv=none; b=hSGDbDT4q+wn5kykTNWpDUmNf7AcD+8d/jr2gNrElNznLOqmkwuCpfuGiJGDZPYhQ1MnMvuHeNk6/jXXcEq8N9qHGBJ11BOhDMrJqDx1QZB3b8l5hMMqbNEszDD13A9DSuVuCXhkbaBViDDhaO/gNUvvn5zbCOYhzOhDv+07jLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488925; c=relaxed/simple;
	bh=FRapydIMxZmNJrM9Pxa1A1VBqPqtUQ6OnN2R/zJBoOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auOtwP0Eq9R+R0CKbbG6Q8ftRuiHVSPL2Z1IAIx+fWPNzATcmGpVbHvLyWehTlIibAPXo/PDYUplN3GGBljQaRRNv/iD2XZxIya/XhjcDKW/8NGAw/FB49geu+qVxKL/H4gNHcc4tj6NuEy/eIyIf5GT3HSmQjIS4mrsaw18Mm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShqQ6KY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShqQ6KY+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJIoVK023666
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wc7wbesunn622E6lhLM0ZKBY
	dN3sWZP6DO3RHiTM7ok=; b=ShqQ6KY+EvXQdv+pJtp207j/oBCI6PI91JG+xF4K
	ENbUXrQUsRqAImbFnEwjKPynhDig8hIXtaqX0Dsu9OWjF0Qg8waVyefba1Uje4Di
	VN55T/vSLEfn6JkUM3LcMG9BlQuIpotnjVBTiaKe86e5Q8JAJ2zxwZ5n1yuHfyvS
	pUSrAnAYTobW88AWgrAkeh9zycMsi7Nm6W25wPprgLQ15uHBXVGnKA3o47zFrcCf
	Bq+RKgMEz2qaN9SJZZaLxrbGM2H1xEoiGX+NrqlwMUD8WafEgrklNZiUR1fGknOh
	PpGRPXoSvX8BqZ6VO3oOc9xnZPO3oI4l8Wh8vlVFJFTmZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2rbxxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:15:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70707058255so43310496d6.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488922; x=1754093722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc7wbesunn622E6lhLM0ZKBYdN3sWZP6DO3RHiTM7ok=;
        b=lKB1q1Q33prjlGfe7JWS941lg26SO0/1hoLvz8HdwLH5i/PyCcj1UZtNvkB+ehn374
         tJ7Yw5w/tn5dYlSJVS0+QB6x1VCU7xZrmcN27kpIYVDOHQCR3nL9ALTb+KakrNmt+f91
         ysOsCvWdMySYgOWnHFo6S1Hn/XUMvLUiYTLvpmg8sKGX8Ow5hSuGUJ9eNZrdLUvd329J
         tCoXPOoRk5ZwwjW6RBB1gWZoT8LQaMwr0KR//2bD9+OGjN+V20ZUptRX8Cae47lr+Rd7
         YZVjo79rNQhEKgcPyH6PhAkEoodHn81gfeotvLqqT/mhZsE7rh/z2Lt6pirdsAQs6w6A
         gXNA==
X-Forwarded-Encrypted: i=1; AJvYcCV5VB3yiQNmrCMwBcga5kVUfE+TaCUNTs25gnMAX3cJb9VybyPVD4ymTaMWFJ/ZyTjJGm79jqQ+zdNnSR3Kp8xZyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6I0sTKCZLQOvitIGFWjJ9OjfdE49p8kOJP6K8CwHqAx/4t/z4
	R0snD2lkBxnkupT0j34YQbtYt1RSXAkzI8HpRKNCvvB/0XR4jNrX3Yb2irRVEY+NRQZv5DKbPDJ
	w7KOcc5+wl/4YE5xGraaNlaDeSMwOjZo/QoCb+f1tWXNSOAO84eXCsLvTNmNGCPotfDryvap6CQ
	==
X-Gm-Gg: ASbGncugoU6/SpXlipOx2hFc0GAT0KD5snz2aztOnbrr3xbSBZ3Rs+ILkM5Ee7bpJT5
	1ckJufJgvSS1CnDfFNtC6lZzvfO2hJv/sUKsoXsIpfEZ/CnYsdIad7Q6oIyGwmLPv1PmFfzxOmj
	83MCZuHjU8whD81m/iC8XL1vtNaS2rzuHd9gDJiH0OrG5W4dwB79OBsNvl7GP7mhTNc+wcTfvEd
	JoUP6kL8dbgCGyDEm47GqwxlNsynUBkVQ00QFsr1SYFOZXICkgf4Ichmm9KrlyQnQWetXPv6egJ
	Q0f4aE23WAVmveMMgqzqbJmEvJg1gAJup5eDrP+iLl607HOzf6G8OnkPey9rEQoQNGwSO4JgDrj
	qpAnCc0p44hctZiWbdU2pFTJHhpi+E/IeG1UN6uLetQdYtPSYIy80
X-Received: by 2002:a05:6214:2a88:b0:6fa:cc39:68 with SMTP id 6a1803df08f44-7072053c3b5mr42704516d6.15.1753488922036;
        Fri, 25 Jul 2025 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxKX4spzgAgy045riATOyKNu99U7axrHMs7Vy4UMZ91CFAU7dGAREfsaxr4wy+fd4nCMcT2A==
X-Received: by 2002:a05:6214:2a88:b0:6fa:cc39:68 with SMTP id 6a1803df08f44-7072053c3b5mr42704086d6.15.1753488921541;
        Fri, 25 Jul 2025 17:15:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f427c501sm2101441fa.77.2025.07.25.17.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:15:19 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:15:17 +0300
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
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
Message-ID: <kmgosc2oboburyxrk6drvfghqg3eo3z7pbeywlui523aoqyuqv@uyog5cv2ijq3>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-5-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=68841e1b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Ui6KuL_mdHivunMvz7MA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 9cBri9YDXYl9T42QfrgEIuxQtuYEvxCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX8s4QIO511fmT
 fr6pkdPZQwPOssrp2mvxvxPAlC4BujYEPdvADguuJNF6EW5yJazakaT5gnE2I0ZcahD6m/KxHQZ
 D++SGKUh27fmd0AHRyeVlpZXhVXxDh3O0Z1l+ZvReD/lWHd74E33g/cnQL9MdBkGtek0M+yDSp5
 QBkiKu2LUnlPKcUVuo8dWTHzM7sw72wTnND0y7drW26sw2BIhEv9xX11E4RO07Y+39fWNIH94/Q
 mlFaqwfy7Fv9HT4dpm6VnQbdmJGmH69tYBer+ny9HZRbQnjZYQ+ieVIv6cwMt+Ri99Avcsrt45i
 ji6luFR61FFgIFeLdWa/iCo/AqlYDdeiH67WIL0h91z9Qh6viiHOsdDnJnuydUV3P0sNPftRjAV
 OtWlh4ZymCVjbpmP77z/3IyT7fEFDnFjT0xNVYYdVIL/96hxMmd99za8caNOeOWeTwDrhAfE
X-Proofpoint-GUID: 9cBri9YDXYl9T42QfrgEIuxQtuYEvxCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208

On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
> In order to move the parnel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *bridge to platform
> data struct analogix_dp_plat_data.
> 
> The movemenet makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
