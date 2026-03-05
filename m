Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635B37B3EC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704928; cv=none; b=qXdqYSUWzbDwTdUO/XwECacnMWRNaR7Mj8q4VtTZhb9RbHNDxVE3675AcHyOLOJyF0Pkd8l+Jpo9DMaWMpPxC6xAasSKYwPv0diDKrLGToTlTi7WSV67Ngb9DSrAs0Xqj2t4q4UwTPQB4hDKa7hEvhSbnGSb6eKm59iPztoEoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704928; c=relaxed/simple;
	bh=RXg2e8kwPtLqgu+p47pq1aAEIJDQlri2Z32TKUvQnFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBL91YJvJ3pidbbiqEa7gTWsZldHcgg1lGAVaXwxf4reXqQoV4qdb9AiL5nZTZOv0JUsZfD2XgUG+hxS6gaJoOfBut68KmcPlZUaEk+5oX8AeZLG4Ct6LrzoaimrOkIzJpCzV2wcXZkh7hTzp3lHhnppVEyrJFsoLNHG6BB29+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brmu9/RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzkdT8ad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brmu9/RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzkdT8ad"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258mY4b628790
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=brmu9/RF7IkNb7vS
	GOOWrA/02uQjWusa50Vdsz0LLRigCGcb9iWdQqm4qkaE4wjH9aWdTeJQoGX8pXIF
	gWx6LSiox0Y/qsAci+Mdf0pfEhSE1ZGVd7tCWX/F04t7lWB5/o/mfuXEsavW1pqe
	wNr2rwDs3YQTcGEEYCbb+7lrMNk+7H5gzOPLRuBcjjto7wbzv9M8XZdcnZPekpfQ
	gFGwSz4oz0kGy8ZsK/RQJqRL85/JjoB8LL+6ufiEUZcEJSlMakUzDnXg8dVbq+lX
	6az8JKYOBUz+FKRyzEavLT5vMNSFnMJi6xILAaiuN1nYMi2n6aLamDcyl83ioOL3
	JHChSg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2uqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 10:02:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a1be41f9dso5570446d6.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704925; x=1773309725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=KzkdT8adsPDcTB6kTuUR5L3tDI7CHoCkxw3Ff8Rpuo05whCN51SGYUaaueMriirAHq
         rYNsJAcHzanY9QGB8XmU25ZZ0LQ0lgmPG5A5RRbmIbGmo1ax8y2XnQvKpITUheBmou7l
         YMfUBTWiDDjsdqxGTISKSvPkRT8oaBjbje4emaVzl64L/uC55Jqp+tczHxvzQbO/cpFQ
         TdOcyPAtQJy/n+gYJalHV0Il0eA28IyYvN5JstqRNY6sEwqyoJEduC86Pm2xX5cR6H7v
         HYXGCUilAqGfQxn/8zzTS9wkuhQtF4TBIVaUiQaPP/flyKX4sppyRkrWw5Lbt/QgigvS
         l0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704925; x=1773309725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=Qc6Hg8iSJ/6vtslqdOXkw8awCgDOacvYjiqm28x6GqzvY/0j62C1viZIfd9E89Ua3k
         DIWowuKCmzoIRN6V5ditX33LTFdQw3/Hg+2teNEsdNNxCvyE9s04rn40qW1/WafNyW1g
         2JBFqnEeaeYc7lTjzsYLdagIjCyF1yunmZACvIy0AK5IbmCiJQEY8LVBg2PYwiUQS/bG
         SgVO/PWLb9jMauFkEt9cNO9Ar5G5TX0EIrdtF9EpvoVnve3+GcvpNJWuQDxMhEuwNyNk
         B6ljBllRylyGH7vx4HC+dqe1x0Kb/RNt+F7P8W3Aq5QegTPIzcEZQJnVakERKNJMEV7w
         4Kgg==
X-Forwarded-Encrypted: i=1; AJvYcCVq+gAexgyAcpgpNs1JegIABn5Sbkv2xutY3WrFqWmhUSenC6WuS4Q+z7rGgNL2E6KhNimtuzOoNhuxC99DkCvT6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0b/zxUEXgjY/yPxkWOxSiIn5GolVKxYLo2QfKWBIbJldoja3
	S/K4a0qsqV92HcT9JbCH/ZC8VDrJvjHBpx+9bSdzUg/SEwkcv9brrNkvRYb+YtDBfhfg1CI3J7z
	x77TxuzLR3aDkwXhw5khUgACZbdRBeZBXK6wMQtvcYbGdqdg9pXAsF+ZLp6M+a0LLFoIsKgTR7Q
	==
X-Gm-Gg: ATEYQzxRF7js8sw3YnoyVwHY0mwG1ZSr1AQvXE586dsG9WNgYkO2/kKv4mNx84Ogm4Z
	hYdci5glzYOzrJDOcenLpNtQYmBVKq5Ezq6tEczgRL4ADfvkxWS9HZ6w34XO3pB7S+Dt3iJjmZ2
	yx4zoZQ3Eem7IEllM/9NpE3wEXP8N9cSWIJVdnlWJ9TF7mowkbaQ2AGXsw8j0/M0UwVhXJqK/E4
	Zz3ujcncYmVTh95PRvCWe4rZGhG+ctLxOQqrTvVu1rNObY0R2lHkQp5FDxgDfTMtZ8agJLcEKZz
	d3S2uHt3TGoBwSessjP5Gl/UQm5WBn6xMMXL8cgsAOrOJw0Qv2ujog+yDLiBKlJfh2+Qt24aPM5
	Fu4hGkpgsXJak/3rgoYpLoDlm/ddhaEKjSGIY26knqU9+MxT5A+fJ5OeD2aGZKhCKIM3v2bagtV
	hdMx0=
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47022296d6.6.1772704925327;
        Thu, 05 Mar 2026 02:02:05 -0800 (PST)
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47021826d6.6.1772704924860;
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Message-ID: <24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
 <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a9549e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RQncaQt55EiIgf5kr6IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -wcQlNFhI7LPk9moX5SmEC1cyglZdyU4
X-Proofpoint-GUID: -wcQlNFhI7LPk9moX5SmEC1cyglZdyU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX5nRGuJFRfjGh
 iN2WsUsjfBf9csmfouygqCzTgvut1PKu+Q+SwItgbALMcwm6BAEwkba9iC8cg/IvLWCAE7cO9pc
 AWlIA39+nKpwVanCuf+gXNn1xJ3cnPULcZ9ryra15Prcmm8lcM4EgPYV5jU7ZHa0AAAIfzbhW48
 U9SLuhyn2AJiX8NXbj2oVw2vB3YaEzUz9wcETiHXJvW4Xf/ZoLhM8eSUQwONNVOS4J/QObd5u0X
 6tCjewdS3lN+1V565R6RId3Tzhj0V79HtgEjvzDsnUDlvwXzReYm+pWk+dBve8fj02bjnXGmP5f
 Uubap9jCyVoTZW2LhPVboDEJu2l+04ePgH8E2OtKCYArSxfNI83g2jQPAinyCuWTEwSU8SRpdcX
 57wspQT4eVhsrIp3U60t04QtoB8y+1zsR8E6Z6E/2LzkjmdF9nSpbRx+33jupaZmsaAvbnOYYjN
 GUmp4HwvnafoyaPctqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080

On 3/5/26 10:55 AM, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
>>> Unlike older GIC variants, the GICv3 DT bindings do not support
>>> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
>>> series drop all such masks where they are still present.
>>
>> I'm having trouble finding where that's used on pre-v3 even.. does
>> that actually get processed on the older iterations?
> 
> I had noticed the same, and had asked maz on IRC.
> His answer:
> 
>    "so far, we have never seen a GICv{1,2} system that didn't have all
> of its PPIs
>     connected to the same set of devices."

lol, that's fun!

Konrad
