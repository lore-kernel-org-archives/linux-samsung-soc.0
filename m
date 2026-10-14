Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC185616B7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995780; cv=none; b=hLdOfrBfybmVa0yf5/Ha6Txx6ci86DuZltGDiEG3oeN/zpM0zFLDZuEN9lKJgyFZC+BVRZ9FR5+Rlb4rIssXy6NpTUDhRscc4l1J2XznarHw/hKi2MY2gbdv5q4SGrM+uxsrzbRPRnHiuCWhWkPHoDV/kSE9HHB+rO9owOCxWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995780; c=relaxed/simple;
	bh=PklsOs09Vlf82YwgBbtSpUmzn87NUh90iD+8UJYGK3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkPOZwdr94UcWrpbX2rlp/KfcmcfZkiZorc/BtnCY0TEPPVY/XKaXzTwMvyDJzGwZNvvIJiLFf81mxKrqzgmy0M/OtseE/EjHwegytuSiD/eyAl8OfHKMnrSQD/pSuoDxkj/nCwEJYM/XVbCVnY+inQJm8+H/uhi3Nznmrqal3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTMjNEvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6TTLrhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTMjNEvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6TTLrhV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbQDO3813070
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 16:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=; b=NTMjNEvYqdTCrKll
	f6XgOd60FLUu0XdMAj4D7IwL++ZnvVk0xw3E9JzHsXJ5cLwEOOQq3ip4lcEj3Qsz
	FQjLfPpM9zxfgv3zGMEYeSPgpIfndEwxOrtxSneycTU/s2FeHk06HmPPMYTlx3Ma
	VorPWR5d7vtllaxOSeBTeEsBifuxva5XOLjtdg/zpLiQ7g7soCORo+i8zsJMNwgG
	YxXHxU7XBSeSJsREwCIvF6zEhvS6aRW9IHeaoxldVxCCf5PaiaNXBVxwvpYdbwWi
	wKzzxsCyVjL0f6aT2QyitUg1BKR992QBb+EQK4OC9L9HmcVsqp7eFdoRNUTkUea2
	QRN/qA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2jca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 16:36:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so83792585a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995777; x=1792600577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=;
        b=Y6TTLrhVhlcXX5WZmRZbeD6ohqU2i5YpE2EAkHLJkWSYXHJlhj1ZxDkK2zEVvXkrTq
         EJieSrUjxDLNFGdXgePJXqBPQrqPD9fUXEQDe562osZrld9t67GJTQjJFMbMj59QI1dI
         5yHYC6trTqFSVCKpPmGvHfo131p5rgeDTDd+DOu5oz7EeenYq95dkvwWhK6EwQtVxgFD
         D/J5hojQImNhJ7w6Wi/SkRLbWAlCJwU8CG4eWP+3rnShOuGy3O//XNhZrTusDXNZ/bFP
         ciT2qy/n+0ewDoBd0LITtkfD9WdFB5LJdbVGWL18tZ+spR5a0YmsgMfd67z+O9n0vwJs
         8duQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995777; x=1792600577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=;
        b=I6PomrUhGjzOB8RQQHFkoyZ5W0PtmbDVzz75cOYaFyxxwZB4mgspylZkAQ36Nx/3+1
         5mGHTJB0GOfd6eK6dml77UDikLM4GFXr8Rnt6bRDQUXYY8qZx1c/Qh6N/YFl8dWxCfJk
         YT6IrRpL6wyvjDkfABP4Ywkgm0kyJIXUe7wW6Z7Tuifr/bGmSMeTYqEn9pXdTXKPhmwD
         lkmd9IRhVtemG3QkHmG742NCHsjsfxgvPvaXM6ymwyIjQcCiXyiTY8ZLmNE51/BevaKS
         sxanzkQBDVmhPCGqK0tR/DyNp3tdoApTBF/cCiDIGvYcAv9lJKdhgtYDFFdATtuW0rbm
         55XA==
X-Forwarded-Encrypted: i=1; AKwUvBzVyWCUkogVa9vCP4KiXIEBsGrQhGwk84ysebb+VQRBJylEp6/cObw/vVs5QK48YpDS+JzSroH9UZJlCJhwbw9i6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMxywZKNFZmOwupbupn8NH0ifv0NucGCwbPEWSK6jFX8IjfrKs
	koIxqP4AdODyjajKc2+BWdgsxP7srtggLzopwEbr+0TqW0Du1zZYYRg58LtUEreusT8PdtvIOke
	wC80YHtYeq2R1FWKZBzuwo+VU7jXpZ7I/DyAQPy9YN2S2Ti3tiHmXlPbYgEEX66nggekS7Pvhkg
	==
X-Gm-Gg: AYBFou1bfPq1avMUtKP4nmO3UaPNZZFBES/ULiIkkMu21KTezb02b5KTiChCLQ2soKK
	1bKlFNE5svUGOGn5lmwTMs9WlF7uTXigQLoxTvGA5uIYfYq638NjvoJQcrp1OZbG1gpmoiErYYB
	SVLRqUtyiOa2wywKOAHHTwWT1+wRLJ4wHrBHvhCzeY3osQLpQsp/4aBaH0feWWRZImEexPy762j
	7UEmAOIj4jYAzjIz01V5+p8uGA5ErhIqBggQdkUId7ld92iNmisxLt1F6bq7RCLey/Zrwo49YPy
	/OsT25R9M0E6Tn4eLKq5peqxjhMHrijfqyz6+skn2HdV3I/DE04Wd24yBQpLpW5wI7RUHjDKlcQ
	pmGG+Xn7icAhDSeWFn40PTA==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3128587385a.2.1791995777371;
        Wed, 14 Oct 2026 09:36:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3128568885a.2.1791995775873;
        Wed, 14 Oct 2026 09:36:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20386327csm1289977a12.18.2026.10.14.09.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:36:14 -0700 (PDT)
Message-ID: <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:36:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX7NWPTcxGJ8Z8
 icU+h0lYGYRP4y2kySuSf86HrGgI5d1oUoBSCZhj5x+lBgqb8bZJfn0ekcXZ9FGhb4oiWLTnvkB
 cXqGt+L07Cz2xOER0jFjp12jax3tgQk=
X-Proofpoint-GUID: 7E3nn1NZCnyclOkAvdv8lOG20lsfVYXZ
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfaf82 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=auHUQpDKApYGa_LtnhgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX7exD1WZ0eWkN
 8sGlfWy+i1WgMajmaoSujc4NPidtCVnB6t0Gln6aDxzF6Kg+p6a28dnYlJY3uqmOn/UeyTb8GbI
 JTM7OKzh2biiZxLqhramVykD6eez81qDKebf6Row0RbzH/P2RRuG1EK78hBew9SdRqIY4nMKYwZ
 +1v/VFDRLbnTk3KQWjZfuzNRXRiYofmQW1NsmC6SAyNNiKV5lKDHeRXyV+BZNpkPxRUZZ+mqymM
 Z+P/4FRSN91t7j+e7SZAQOZH6vMya2WXkMcvnZX0hh0iRZ1iCvCk5Fb8tv8gQDtOEcgixCHNnhQ
 /dVG6n0DJH+QN3xK+c8/vf5ACAf39thcWIydzvQc711bDeInCfZf86PyztH4dSXUFjLg/tcPMcA
 5t/JLssFX2vEiWNkCwkNnuGXCUyYdqOQJcORMOKNpc7KWB3YQZwNYmg/5qbVxwNt3vW2PgVAj4N
 OJXc4tNkEYkmOBRGz8Q==
X-Proofpoint-ORIG-GUID: 7E3nn1NZCnyclOkAvdv8lOG20lsfVYXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On 10/14/26 11:44 AM, Neil Armstrong wrote:
> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>> <neil.armstrong@linaro.org> wrote:
>>>
>>> On 10/14/26 10:20, Chen-Yu Tsai wrote:
>>>> The DWC3 controller can operate in host mode. It does so with a XHCI
>>>> compliant host controller. The XHCI has two downstream ports, one for
>>>> HS and one for SS. USB downstream ports start from 1, not 0.

[...]


>> IMHO having consistent numbering across controller types would be
>> better. This avoids making the USB core and hub code deal with more
>> exceptions, and also easier to understand and write device trees.
> 
> I was in the impression the port number not necessarily reflects
> an actual physical numbering, and can be a logical number we would
> then map in the kernel.
> 
> I don't see any issue here having base 0 for the bindings and then
> converting it to base 1 for the XHCI port numbering.

I thought base1 comes from the USB spec and not just XHCI?

Konrad
