Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FB46D2DA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236140; cv=none; b=lMZwv5k1GYlYfAwPVeW6Lce7sUaQ48y0F3dGh8YdGr5HmR7sc66foqhUxrOA2P4SVmPP7T+MJBm4zqCD+ppfUaBuzuZSVjo8k5FvMNs8gK5Z2yAoH4EM4/17YThW5zsJ9nzAp2+tBPOro3N+3fFo8n9ObhPnBJs/rMNHjnz8y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236140; c=relaxed/simple;
	bh=Rlg36dlg49DGpbzZguuseW1TDCIQRWjjAPDcspTd+3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eS7g0IyJT19A6lBJC8JY0DbWqDs/+9VJH+LrkSh5pOBGpQRIhjRAMCW6p5x7uA0qKQwLT2Em8WTGlrmG+PQyRSGo0/9lVJZr0tZoP/N2DOcYYcZ9norOHkFEWiIfdmZ4SvLkCBAc3Ec55feoVEfKVr/vSb8HnCOAUOp8alzEtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjmLKskE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9GFQGiX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjmLKskE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9GFQGiX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7ka63234908
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 14:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=; b=kjmLKskEBUQmMzCo
	ULVPSTmifuDAtsOPXPNau2mAkMMq/CFfk59EK13eRSTWl5mP9e3MykSpOwMpCB12
	/+shK29vSs33VH9zlxI6Ji67KsMByUCvdw0mTLiPsigQkPYhW3nQacDatVDptqPk
	sg7/2Zk4Z2Vu8u49EDaHBDtJxBTcuhoe39ihIEaBVCFcNtyJk66KcjoghTuUDimU
	bHaa3rgoRwkHC5K9ppKI3Y1JRR42qieFHuuV9d5XmYTM7b8ZtspjF+le3iyUoMXI
	kkN/7ji12+xnnt2zR9gJsw4BxQ3naFRGgMO0XQGdm1pDmD7UP+p2zSnsR+Vzw+Ja
	TJ4L+g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv9bfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 14:28:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eec6acbe21so43157276d6.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236137; x=1787840937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=;
        b=J9GFQGiXUIkXmeFt93XtXrWCJ3zpVF1UV2NaByW9+X/NPg7/4B0B6Az9UdRRTx0/Qe
         4w8rlUs5XJWFMecwa4+fjYbVa58L10kWFNJTLM0wFzwAtv5sITupT56PIUGvsCM6o9PT
         umFaLxnMgD3tmWfnk2GbndPDStHQotD+VD1wacwKSEnOARYIy+bztmSQoAsa4bff59Ot
         ztawRYgRBcAzSiHwWraJHcrSbdxPYFAe85hTqrs7x489mF10Exx7LtH7W7o/SxQPUOmP
         Bl7NsvltRv6THTacrYzls5ZcCjw9TK3hsTG2BsqCwCnCmIrLCKE7eJXIEVOir4DVgnfq
         pb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236137; x=1787840937;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=;
        b=LK7LA4syEwRP58VX5XlLuNU7AZUW7pMBoRlSWJjfx6MDLRvzP1Tp7r00zZ7uq+0zAo
         iRxbFJOT2kwDumve/zUvKoMsbWqwOUL+zlHqlCDvE4PcRu8CAw7Vyj5g+ZBKmbKqvZEo
         yA3ri6kh6jpUqjFT1PN+poW4PwDM/k4dpK1aBl3RZYlmgV4hQ6Mn04e6nEED6IVqvlWL
         g5VeZsc5gu7Qsqnn8ULNydWn7IBf1vbuMNDd9JBG4g9kn+snWuS1GOyWpJHdOTorTafv
         piWD6MrjhyXOrvDxeYTmAvq9fPv27NiUwKe7JmGJfY/sDy3LfPiO9tvnKbOmL+N5yvLb
         +n/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpbx4lGZING858jOUZgfe7fZiBbVZmrYXlIRooTxkOeci/nrbl5eKdAG7Q3NM7YVC/65Aw7pBVMaRGrB9AtMg0lkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GDlMO6CcbBBiRnQTC0noFYR8t1v2KJ2gpHwE5I/JtofJWZ92
	XmWyZjoUjEI6vWXkCNuIRqk3PMU6MSg0durHcInw84CajvrUKva9CGz+cP/6GICnCLplpKEjcn2
	6jW6fwoHJ+TxN2uhw3BWX7KPsEPeP66pdGfze49iAyjZwONpCJKm9r2B5lf9NgMIVgFuaZfHdfA
	==
X-Gm-Gg: AR+sD13KKGYq4jRC0oNMuK5TZ3rYskp88LvSc5OvMsLt6mabzQWCmuNNFIVUfR2aOpG
	4+AR2iRe8p3EkqT4mJoy30xIk3/xTMWqQPTOoNVgik06rCjjLZXZMYZNitMDsA+rgtZMO11tQji
	aBLCOtXaSJL4N6kHE8Aqii16+oBe9Hkrd5P18mFgU5aLXrJ0CYq+TOsWVU3RbwAdhZyYZEt4MJP
	cGS1GNg5wpTbtQRuKfFOZcCby/vIBHyBlzgdzAawDTAjpdo1QWyI5gc7z6tC54U3P7Qk+CyhoA9
	nWD0v6gkLSOU0KIuEpW8M8u3vChPe1oZvwtL+KBjdyq9DS/oqkczGh2HFYf8CEsTnzVyD/aL2EM
	GHeVceCgMDum1dC6X5xls5Z3o5QFI
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1417190185a.15.1787236137195;
        Thu, 20 Aug 2026 07:28:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1417182485a.15.1787236136788;
        Thu, 20 Aug 2026 07:28:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2148727sm48532405e9.3.2026.08.20.07.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:28:55 -0700 (PDT)
Message-ID: <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:28:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Thomas Turner <tturner@lineageos.org>,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a870f29 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EHrKs5ltxLiqmug07hMA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfX/NI1VswqwM2Q
 IgvfP8AtREDD9T5//h7Hgov2/mGuRu3XDUkW7HLQXX0d+nKgGfsAz6D3IUXITnZns4/PxUjz890
 Qu24uDW4BN4JXK6p5jVg8ZoaijLUVAcD0Nej75PyhOPCj5UVOj/ihIyQa2BxoC8oZGQJiMIvLUJ
 rq3kVv9nLOTMrC90FA+0ThIqAAofbGRhPNrUhwZXONz1tCAsF6Pd8MghLjdkr89McM4k3xdbeg+
 Zp6ng9DrvWJlDfCYlBr70qEvW1ABzkRQjcd7xNrKp3j5WkpddkpmmWalAcpJzp/BAKSOPY89QQZ
 f7Cy1Z0LfY50JCxZyqnJoxRNU8ZLVU3AJTotAsc6LBBHRRpVHCkfPNnCiILieWumb/YoZcmqLoD
 d9u22HMmor23fSCEgwvObXm4pMbn9QVsWpa2Xtl710+nTJc6VWRfEwICcQ2pbBXHoWawezWdyeb
 5sWn0dI9sdW899yXrYw==
X-Proofpoint-GUID: prL7ITHqbKoWyUl79Xb_3_voUePlcL4c
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfX3CozCul/V77y
 rCB+KMK/CFKIduqZxBwo8M5AF6ffYTwRhyOExnVlp/W70wCygTxGvbvHjp4VYtGAGjEYSb5ESHe
 0i31dvQo6qf/UdoNqi4DF7J04rO8a0A=
X-Proofpoint-ORIG-GUID: prL7ITHqbKoWyUl79Xb_3_voUePlcL4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200108

On 20/08/2026 16:23, Thomas Turner wrote:
> Hi all,
> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.
> 

Again: slow down.

Why does this appear under empty subject thread?

Best regards,
Krzysztof

