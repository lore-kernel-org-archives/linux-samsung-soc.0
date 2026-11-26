Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699955;
	b=GMvbhQ315Y8A1h/jaOOeJDv9Tf6o2gZJ3ZGuEWhod47/Gbhex3FZ5P4uJirrcNDxbJsz
	 ZeXsPuzTyWOTvm2UccWhL7hhBIaXN4KO0jOkWWKGCWAKyrkqLUuCUWLE3XFRtnOakJ+vm
	 SJ4nFZAMpMs3PCsBiLV3qW0qvXbMVp004xWEPrR3oJ6Lza+c2AZAI9vdgWcBbB2oRY+FV
	 9NCT7vdRMDaG4iXsRPR5YpTKPcS3vBxCGiBvjIyeTCo2cNOwOuUUhrX703k04ylNr3BpG
	 2BCdGQEqb5I9bOWP2sCfb08R6FdWZZnMVEYTxPfLYrYD/He39ZFOSNSMzfUreXklFkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
	b=qGkymiJUNQhsqY3uritPSQK9ERsJOJRqjfm/DnPAfLMrp8f7sRgFEPWPN1cVxaJC/wzv
	 9Q88lIl8cgcr73SuDjxLE/tmshQ4q5djWHxqGuFiWZLP1PVRnxVUuZ+HXuSsNaB3FvCee
	 IoAsWOERliLy8xBCfOl2P8OmhKQjo79zlu4zSDZZYfE0dPum3enyWHRxKlQoLrg2RMvvb
	 zrOn1bOJk98u49bpmnTXepFPuNjHcMpQi8gXwb2LdStbJY4QBNBCBwOh7xMJg0DvLkugD
	 vMizqdwaXCuN4zomnmRWsgnnO4rtwLyimurlckG4gZbx5mdyV0yFjUOpEWfxhJTr0Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoPo7sJe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bn9NFgRB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D2606A321
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoPo7sJe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bn9NFgRB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVWJF2785186
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=; b=PoPo7sJeg+xtsXCK
	fu/4K/5jjRDVGzOFe1N/PocF2ucAdYwy+P/4K0O6OHFTo7jMYNoy5+WcCMRHfrSB
	GXVhj9pxbdKvvtTxFZfb6cGptg4VNZZA4KjdhPMVh8pjxBeNQIWta57Jdt2PiQlb
	6T1doTNGpPG6VqSY6o8JRYtFOcHhPghAG/trL/oAkmXB9GBYWP9Nsf36VCIT8eOS
	iIKfwj/TigRSmQ+BiHJUoZbvEFLS6AnULQw0xa1/TB5+vwvH0HGRf1uLVcQdD0QQ
	+TaOCz0Bgoy9Gdo2hPcOGNfiu3EYnl4adIRh4+jIDwWeTaB7zC95usDjj/ywD68c
	4M943Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb3vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:32:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so7050875b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699952; cv=none;
        d=google.com; s=arc-20260327;
        b=jd7p65U8NMY7qnQck8AA9OKweoeJr0VB1NiC+PspFGvIVUTlppbPcpnBHbidkIhhyK
         RJ0TH5s8nhKTyQTbSv/L30WKMCKGHMicpBK4PWuXxni1csbH7JdmNg5Js9awEKcJvPrM
         mUMWRyZSD3sGmQoSApdi8f0QTQDk3AG4MEJp/T/QacfQfFe2RI204iy2m0k6p+3vx/F8
         6iF9pLjNxwkCGt9zJLhK0rWACcpHcHTngC4Bi/Mirz889+EZlooPNgR6aYrlsxl7lPRQ
         wHE4Yq8FgAtSG7fvkcOTI4N2xcnuoyU9bk5zBV1VNmtqg2l/Mce8j6Vb4ySGlYgAS8N7
         gOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
        fh=rG/Gt7J6uV3nKJCuDJUFuI1tO6SBTluAF7y/krqmG2A=;
        b=fqDUsjIK6yk8QOWfCgU947EyeJQsBKj4bu1kR9gqpEd6jp/2DMdsILG+pbCDDdwZbV
         Va002khF8D+IEJdpD6q+gpr0YHNxuz79V4kF6VupbCRBtSNHNuAoNm4BF+AY0eqASdWM
         aGG0qQ+kut+gV6YDUTqWBDDdxNTjz5iPdean1Muo/NkAg1AhO11sMmQSttQkXr0TX44b
         VYmwZTpOzhUWtaTKyUvIAo4g0yzJ1/bB4UF237Xnz5PObXB0QUr4C8olOS0fJ8eRAuDE
         AiaWXTjMzGzlg0ptE4345ivnmud9P/4S6XszPxtltvEJY92R+d0QoouJw29sWxyCIbqO
         1DZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699952; x=1796304752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
        b=Bn9NFgRBU2XDrVmNMtEQIgtqmptwfMr9fHCDkhI/OlF/a+z4boNAAoFApnWYV1/U1U
         fOB0EreIMmS+KHsrNRv7NDSczM0fBmnqp03Mp3oVk0/FgVu3ns5IG2/Mj4/L5ER/xoNS
         rpgoEQZwfy0FRqDQG9OgDivqGeo2aPOBNtFijduSJee/bQ2k6M0C3sDGITcytaVgcMER
         gfHRujP6pdW3X/cazbh7DTVW8NUdL22TvWr1jjStGZYUMgraqApow6wUV7SplbYifVIA
         MDJNMCMa8wyqNza8YddvD03lN6Ww97vMTGi42P/d97I+uCpSjAXWSE3UVEL6D8nmT19G
         Qkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699952; x=1796304752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yhN6/Aft4n7LT6aQzqG5kX6MMiq2h0tM47m4gebWsQ=;
        b=m7keYhifTVd3ADUDbATtr4MnWOX4fTIvTa4rcB3LIwb4s/EC52l0Ta0x2xeBBvZ7y8
         rXGJQhH0YRxXlveEb0nOT4Lr0GxdDCfBXFsCv4Jenj+KmW8HUXkJKT4/+d+i+0/Mj/Uc
         8GF+FENIPgfT49D0eFxu7NvL4YerDnP3LRdiJYBPESi0eeE7gM1LGLfdpvoOUPucXnMc
         m4GnVt/YxfM09fL4AOGtqfFAbkhvFmhJuSiAHXkrZCgQha/xYnzWloNLhrAJr8Qav/cT
         XRp0ETNHtwVTQBHEPZzO46StwZr1XK9MnF54XTVlDIQifM72HEK79hhNbdH1ZUd6YMmi
         22kw==
X-Forwarded-Encrypted: i=1; AL+hErFYtwiwPQkrooeNpMERc8tJPi+PeO4enTDfnS8rfM/q0FFDUICCtGZhbLVIKmTflNAWAu5LwQ5XbO24Jwt2IYsxIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1OLO5nBFNERle6/vMeqrdUOBrXMjSrXJf8LKz/NnHEtX8bEX3
	IHkZVppTdJx4AXOBD3Oxn+V4WNNisKAiKdBUOn+7uMnSz9GUroqSeLtz0BCKa5YY+O4OSRlUzY/
	wzkSAwVKVqeT6MuCPrR9U4C9p3Mg7K8WzY1IEp0YCyiXjG1LVCNHTCKc75y26+DUxv2cOpMq1pm
	w979Ck2k3rpz8r1ix1qCILYwE92kRqW59mGMl82TAeyB8qgQSk
X-Gm-Gg: AZFdTZc0U8ak8/3kM9aZDOm0en6+Lku31+XvAChkyKDH9YoiYoyYvnuLkuByZEDbIJf
	+ePw9xVBJVwuWUYBLFISPzg3ELTYQ5didKjwhgibFl6GKlH4IbIOjjiIY1AY2I18waSaHHquKMO
	fpIUKTD4OkuTOotmANmSqfknH21WXuB5FgQhKFVnms67Q6xzldEkqMplIODQ==
X-Received: by 2002:a05:6a00:3998:b0:8a0:5da1:2264 with SMTP id d2e1a72fcca58-8c87d2289f9mr17554759b3a.47.1795699952420;
        Thu, 26 Nov 2026 05:32:32 -0800 (PST)
X-Received: by 2002:a05:6a00:3998:b0:8a0:5da1:2264 with SMTP id
 d2e1a72fcca58-8c87d2289f9mr17554733b3a.47.1795699951925; Thu, 26 Nov 2026
 05:32:31 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_3D56658FAE8FA8158A1175935B194992D907@qq.com>
In-Reply-To: <tencent_3D56658FAE8FA8158A1175935B194992D907@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:20 +0100
X-Gm-Features: Aa3M54qXSJDQK9M8_TJey7rIFwFmkk5uLORdWM7iQeDYcpEdTPrd_CxmSK3nm9E
Message-ID: <CAPx+jO-JsScaTCX4_OTxGf21b-yTGxqGcLRVGitHrK0rKU-yKQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: samsung: fix device node leak in exynos_pd_probe()
To: Yuwei Chen <2522445001@qq.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1pLTK7nnO3YpQrptVCM_SJ-OD_KO-F-2
X-Proofpoint-GUID: 1pLTK7nnO3YpQrptVCM_SJ-OD_KO-F-2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX+fTjb8q0JNHX
 /Ia9I8nTAWy53m1BJgfqf1cW/yNHm95yUeJFsTHkZjzGrZ3aTQIxkxMQBG0ACBtL699w0aQn7Qi
 FcRpoOWf0DJ6X7xxfYINKGd8yljmNDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX2fBov2bwkHUt
 gT/Ch7UMsvU8lzbwBh7dJu1Np7GxO6sMQuiz7s7xSusFYv0Z8IDNzgjDYBTIW/BLAQvyC4Ve6Wp
 ijUUGJu9m/38DWOQp2nuBTtRtamIgHJjZQrrpAOEdDhGtnREleD8/ejwg+R70ai37VUD8Yq/l7J
 yxwBErfN147rPWwb/O0jJYqtagGCX/U5RGt1gumBzt9+olJ0hDBih8bDI/jt2p5gu/+xUwLkgG8
 GOKV2n+rEpfhBnyLdRTe/oFAchyP+i022ZCSIy71YT+xpOMYxNw0GrQ9tLSltsfapV3Visu3dLE
 l7Woz0ZAPc1+mYeETb9CTxkjndQxGe755cIlTM5VNe5PMfojRdWja2q08qzweFcO8Z2aKSsfAea
 w+zMsnCH6rijksQlIjdhNaJmdXdyhmbeBw6BugE9EbtjC6RAPJufW0dr/Km5fU0zob7raJTnLwm
 ZZYb0I67RHilICkL5KA==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b0834f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=dZbOZ2KzAAAA:8 a=VwQbUJbxAAAA:8
 a=mD-zHhwtQrdt06HBgxkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Thu, Nov 26, 2026 at 5:26=E2=80=AFAM Yuwei Chen <2522445001@qq.com> wrot=
e:
>
> exynos_pd_probe() looks up the parent power domain with
> of_parse_phandle_with_args(). The caller must of_node_put() the node
> returned in parent.np. of_genpd_add_subdomain() only compares that
> pointer, and probe never drops it, so each domain with a parent leaks
> one reference. child.np is assigned from dev->of_node and already
> belongs to the device.
>
> The lookup runs from core_initcall. The extra reference pins that
> static parent node for the rest of the boot.
>
> Drop parent.np after the subdomain is registered and after the
> messages that print the node.
>
> Earlier trees keep this driver at drivers/soc/samsung/pm_domains.c, so
> this diff does not apply there.
>
> Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platfo=
rm driver")
> Cc: stable@vger.kernel.org # v6.6+
> Signed-off-by: Yuwei Chen <2522445001@qq.com>

Applied for fixes and by slimming down the commit message a bit, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index c8c2ea06e990..01017c406fe6 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -153,6 +153,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>                 else
>                         pr_info("%pOF has as child subdomain: %pOF.\n",
>                                 parent.np, child.np);
> +               of_node_put(parent.np);
>         }
>
>         pm_runtime_enable(dev);
>
> base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> --
> 2.53.0.windows.2
>
