Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A404C6EE0
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527555; cv=none; b=K/edpvey4FgB39tU44rbQeQg1BFmDyiEPNLQzdlJlQlx6eh4aiKHWlpYywt//t/KpRP48490ZTIXl5HPRb2l4/hdznpvP5rrv7HqPeRN7aJtl6pl50F95Kk3FepI0BJ9Xlq1qs+A1E2XExQYGZtkdfbFd5oxPe6XPiYEm21NIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527555; c=relaxed/simple;
	bh=RoiQDo2vHkOIYi8QYhXjdnc885eNLNOiDk6hnbsmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyNwa5qmEqE9JxQ2Ea9C7mVKmW13UgonFXzElVeFGOU2KKyN9jPmv2OmwvU/aJK1sRk1Pb+145IQFYD3ArtMglAsjh8Gl0pODtkvjpLFjWN4t4RX95eszPuSY2lgeH3Vl7XcBcHsj2vkwOk0wvpLj9m8ZhlAT4I9soHm/WHQxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUsHQt0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub2GfWei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUsHQt0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub2GfWei"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EblCO1476852
	for <linux-samsung-soc@vger.kernel.org>; Wed, 3 Jun 2026 22:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONnM8cPGqCvQUEArvOdVRHLA
	7AjrNnYCfdYyBl3uu6Q=; b=JUsHQt0DxYLPJKgSTR9tREQC+/92i/jaL10JeZka
	jx+w7LeQXnnmF1WukUK+kcEWnvuxt/l+kFvuthhHCI4AaDnS76xdU7CZe4PJzwyz
	K4pbBszfCfx+alv7S7iFmtT9ExLdFXbo7XeJLWvND6VGIKR9I6rEOyaIC7iQ90Xg
	9iCkzFtDeVSeFE9jXjV05X+B3ZHU8eGLF3uNdxHjQ9Y5yb4DSJt1nRiG8no/6vX1
	96gpOiH9tdw6cUja413gftwtc/vaKQ+VyGGi+jsd9T/Go18S/qq31wYXJCMNU+uF
	jhitbT5yARcAW7GDcsEOVJ2x/bh93aalFtYzYhWqyr/g6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nt15w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2026 22:59:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b0a0b727so54487241.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2026 15:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527552; x=1781132352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=Ub2GfWei3yzVNpw5q0on8mOpXQn9Ro7onLdc5uE0xrcb05St7nBIJe5tz8cx+KP4NQ
         432lKORy6YYbfI541ZE4cnABBx2LHLkZWI4Ru3apfNAEAFdWPinb6ipPDjsw1deMjS0x
         nFqTF8TDAFrXLS8CDQtw+JmzbzS4XUIBt/StOWP1z/FjRg/bD4A8oHC1mvoWmCYvEakD
         H7JWa9p5vX+E9fBL+VOIH9jG92D4fGX4eSbpBNolkZA1ByC/8xWOxq17DEJAXSAuSE5S
         2n1240kjl4IC3I9ogQsii0M/JIgM9csy8UgwXG6SjNvsa+at2KjE5XD/TEOuJYRjpkak
         h1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527552; x=1781132352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=L/22335pUX6TkL+m96Obk2QhxzfIqS1XtHom31H2S5QEi90U8DJx2IPfOkowAU3PA0
         4QBrIaK9QMQeU81khHrN8XwpIBHnUKLkFXZYpP3PkUJUiVgdZiKXX8Q82tjKNUlTTRpW
         RfhdMcQiZqNXKmDsLtlDSiPEVbS7PP17txI1K5fTqns59MXb/U7QsCr+GG/pE4t4R24Y
         LlAMNiBHkJDYpAL2gu+U+lU7j9ScLOI243IK/2kvkoG6nquKpFl8QJLeYjACfuLUtBQC
         1+2BUi4CynOSHgkbA254TYYUFcmPf8PpyLM78ZJiUo9sNMIs6UIdWA6YG9j+cw374N7O
         41wg==
X-Forwarded-Encrypted: i=1; AFNElJ9L7T9MYdYv63W3Fi1vtvGMR3vk1j7ZBQRr3t1erYbP41mskXz0tM1+GItWn5RlQzJXmdJ9++agoNhM+Cti/E4WGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbH5rB2MF5UxgAkIRb/PLHcKZtZz02i68iHERsh6+uexDJhYJ
	ax/zH07LJX2RjZYEhS8pfEQd1vD3GyW8SW1Ze3Eub+tLR7gDe9LSW94xNYBT4X1Qsp4foFsl2yx
	ckbCwNfmU88iWtIJj+BKv+7RgV5GK2ouKiZnXQmOAyHpWdEiBXUHaTHR0DC+fnfFFMpzsvxGvzV
	ZqUfjE3otY
X-Gm-Gg: Acq92OH0jiI5FnHeAFUYhbBS2H7K+Vl8goalhu/DDZ7zjEPVgqVSGHGbX5XH8PqcTnG
	AJ636tgifuLyG0VWdrH1BE8Zf6OL25wfNxatQaf6YtCeI/HVdi+W0/LGqnSjuaovizC6Nw1wA33
	RoFwWxRaZUx0r/e7REEAG++czXiLoo/rJn9MVvgokRCWJoST/AGIImlqedAz2ZT77baqjLWdaRZ
	v9oPYkoochCnRm8E1bwQye3GPPeYSJIgO3P0qKaVCQGCqRMieWEugo9HBlguqB5WtevO1Hchv6w
	XMv5thEUagq947bjm3grWehoGA8k5fDPYKeY8G9Y+ciZzXJW26vMHF0awg//8mhJJv/MJHQiQQf
	nhFI0nhrWIyoO42IlHsIEaTii7E03ZIdFSEYgu6RXDXaOJWxaGY0W0mn4PQuJSftw7q5Sf2DiJB
	nWkO5tWT1Ckk9e9YfD3h1WbvxjDEUX8/YI0jbZ6XIvO3GWxA==
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216910137.18.1780527551801;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216884137.18.1780527551258;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac29sm880386e87.52.2026.06.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:59:08 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Julius Werner <jwerner@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
Message-ID: <pfo7vpd3ooiyfuo3wjom7qzknnnkiyel2kdu5fjqqrq5nccysq@e63rs7lgdfl4>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <20260428200712.2660635-8-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
X-Proofpoint-GUID: knmnngmN3jUe44KBmAKpBIu3RyW8m4P5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNCBTYWx0ZWRfX6lKMbYaMSWvF
 DoCTjTO8fvWkD9hjVJciJT36uxEq3f6MmgdK9ky0wWqlLjwDwyDDc+wi83yWHxeZHl6dxJw7sMp
 MyWrSLuttqlATHNCcXvwAzjd/5rB8Vsc8HCLcgVw6Cy2SEOq8/sxXHm2x1jvrHkzUVNjO8M4hor
 D6BMCFVLCAiv1Xi+fN8SzGpOGUfvMyrR5r1x9AngamwF+LWGRc0SZuNoJi2IL0E9TK8AFxqEDOE
 Rk9StWum5cL43wX7tdKk86OXGPeE+7p35ESdHxYD8g7NQXPqzgUDQqAVuz+Eny/ImGb9EqET1PY
 rJYX1fxhkc2TXt90dm/8o/CAed9vzO9x81SmRxs9dRZxNE0tUPu13uQUbF6phaae2NkFI4hGZfK
 A8b09QuIQcwOhLFJ53CLkzMPd2z+3drY8eAoXD6ClXjq8AqtA2idQdT+4lbTn7R/sB8+jU4M/y7
 L7sVLD6HP8Yrxe4dKwQ==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20b1c0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=MUleZ9s-AAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=iD_vE5mCeOLV2fS3_3cA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=f0F4d6ZXEnSYrzQLsEx4:22
X-Proofpoint-ORIG-GUID: knmnngmN3jUe44KBmAKpBIu3RyW8m4P5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030224

On Tue, Apr 28, 2026 at 01:06:59PM -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
>                 coreboot {
>                         compatible = "coreboot";
>                         reg = <...>;
>                         ...;
>                 };
>         };
> };
> 
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> Add appropriate #{address,size}-cells to work around the problem.
> 
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
> 
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
> 
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
