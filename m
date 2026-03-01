Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0432B985
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Mar 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772375197; cv=none; b=S6yyKf5i8n+kf2UtU/bxGZIGVEvv623kC1ZNmNySjepIT/yCJ/NHQ8kVyQCWObuW9NV+ne9eydIgVnRgm0XwI4vT1Uc6x7Jq1dbSC34kqG0Mzv/sm6+RY8u4PNa3YjbHTSJm8AuyiUxUuOVZJ9AXzv/XlqZ8LaX+zjlPa4oL6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772375197; c=relaxed/simple;
	bh=4K5uDwmOGHHAE2v0HwOM4PoClT+fHAn38D2q2GDRMgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T65HY61h8dZJgKn1vvcM5Eyw896SdSNp1zmkcbL+rlfbrNplqd5LXKWBKSHbewsfHo8qKVrt0eWVuJUj/MBIlwQANSPwFJe4cigpTc8yuBcTslHzcsxptIqhdGGhEx7jzBajyv3CqrsbyR6nt8UDbjjbGQFL7bacbAcSgYc8XIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRT2g4dK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7Udp2w6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRT2g4dK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7Udp2w6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6217PHAM158935
	for <linux-samsung-soc@vger.kernel.org>; Sun, 1 Mar 2026 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=; b=PRT2g4dKb8MUvpUT
	6EeF4Yc+YA+y2s29jjszN5/MbgmHBMMEJ/InzQOW+QAacc9SDBScBPJk+DGdwkBZ
	PjCfggr8Dvrxl/LmbHk57xnPko3poAgrmQ9eG01odwv3xBbAsDgWi0bcbgw0NTvG
	Xn8yWNKhdoG88Vu2VMAbkzFb25QyZBn6tXICwtqUCQn0zxd1oOcsMJpTqORXFIAH
	O7uT+kyxTc1B0yfz2eCunEXApBujjLiTnYhc5GOzmb8pTiNPaCaYSV/g8/wxUcOp
	lNvGS5lg/qFVeErnYC/eRNAf5uA+JDNu4pR9ZnQE7tc+zELpcfFzJUsPh67Tcok/
	LNd52Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshktqvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Mar 2026 14:26:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4a6bb316so4196285ad.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Mar 2026 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375194; x=1772979994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=j7Udp2w6/FDDzIxefqZFAQD/ZxLTGJ8iUzcyfils0rY1HjpUTIeEkC5RlA7YeQ3Acq
         Qtq8sqpGp+aS1B+zk8YyHnG1gpXGplpAZR0XvRhedIz/2/J67IhNFNRRcWwAPfOkEGxx
         xPxkvtsTCznlRWF/uYQEkfw9oDXzKfPRdgDwGNh9C5c+PprszbS5ARWjhTVt6Z198KmJ
         cmEod5jFvRP6jP2Ls6w2Z5RMccoqPjcKqfEWuvMVwT2CH6vXR6ELcvsb9do/tHDJgxNa
         QOekZhE7QnhWXOyeCq6t3Y1zkhiJKiT568KGAHAhYzNAi3kVhWDwtDwmZqBA5h19Bi8Z
         QiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375194; x=1772979994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=nN235kYaDUYUHy3VIW4pcyE0EVE4MQRyOwosr7NLIQdQe1uKFMsQG6n4ydAOZAp5j6
         rmis47UvsW9hkOo4Q6IiTaBQ/fP1xHzgf8qizUgFoFXD/L/nsummDgztIcy0ITcsHJ5P
         Y6zQSr1/I/3aTwrwqUwmjDRCbHiBTnXv4mrUI1bTOP3TrCPFZbJ3zasYoHI8cniiwN8+
         MY/dZyRUvbPjxy4QII6OuOtBuhDZ8i2DxkjhgQkBNaEVenfIwJGNtUeHg3u3kgdYGx9s
         vTxO0jCzpZpnYlWFht3Ys+vMLLe+knyAB7LFAx54nKmUFWukftQ03FahgPa016PUnPkG
         Wx9A==
X-Forwarded-Encrypted: i=1; AJvYcCWGUynOQjE8iA3r1QTXCQSED2Gid+vBLid5ANS/nBFoz7RF1Stq4kKFhJKNMpp2tkdx98KtA8QvfEvYIRr/aJrVFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0eQkdEnjwPlh0dTIcIH+BAvuhtk+SIEgpauyTKlVRGEUXfen1
	Fe5OCkD8Z4i/QxhVTWEgDeIfnLSLlEdMiOhW7O2RU9Tw0mzgUliSFJsMBchp82glbXP/vqzRLE/
	/CNuKMNwh/jihECS4fOzHcl7KDCegS+KRx1uQX/6O9Y3HcsBKjXRi4ngQ3koTONC0kBQU0xkbVw
	==
X-Gm-Gg: ATEYQzyo0/gZZil4G6kefknFGroXBGjzzRQi/h7dO2Lp0hCPxOV7EN7Eso2NkXumRUU
	ZG0C55r6FjCYKOyk1ycrIT6d+2P4G0ROLRFsHxb8pxRZSW7aH1+WVqIS6kfbQNujkhsoHErTVX/
	396uaYByf0DoqO4uaihOrNvbq79pd1QF654e5NvsTkA4Fvf040IlKU+900y2uJV7krRaJ6/oXxi
	RY9R6fqk/CjKagn3hUfjvWaPkMWzc0VXRuwrWUk3/p41/nvJN1XrtarEgjdi/X+lw/Nq6MzZBn0
	QBvSpWMnhKdxffZAE/9EF9AJmXjx/6zwdA/bbCPYYd1/tllQBpffM02NCYM11WwwWggHtMzjN/V
	a+vp5SNBN13WlliKHKaz2WSPACd0Q3Egl9n3ZB6bWuIOIB9M=
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553250637.32.1772375193644;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553232637.32.1772375193170;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
Received: from [192.168.0.102] ([183.193.18.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm8925971a12.3.2026.03.01.06.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:26:32 -0800 (PST)
Message-ID: <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 22:26:20 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
 <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
 <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMSBTYWx0ZWRfX8IOvh4bjnBov
 BBdLs3727bOxyBi830ijf3NdcvzWHdtUdYfAYaaBPD6CBw3Uj9dFsI0pA+lx1VzKsuS1zSXSvwD
 7D2cYe4LUKVpr2oSUI9Kj8MSR0NbEl1iIqN+M0xVE4tO+U+ZXaxKKP4T+NWQYhirrqONPgJZ5Js
 Vh9lOugl60zXRKmge+GlB8FWtWSY+CimYzEl2K2SF3P5ZSZILaoX4aEuvoE6E3VwL3nZyrTprVE
 hg98Mcg8E4NrCuN8gNRSSdVfzHrqu8LngJlxGCcV10+LASCWNvcQ3l9Y8KV+QU0AAHcNLO211c4
 Yp7yVDmCXWGrjfw/W7Lj1uT1ju5CK6zDE2Doap5QokecezCfkPrtjXUJDbWsPUWstcYku3rUcQJ
 yn+UL71hfXbtzrJziPi0AckLqXyT54ZKHeUZcN9Q91C7weVPo1rDuJKstIK9h/D780gixqOxoP1
 3Whk2rzwrNNtB9ckisQ==
X-Proofpoint-ORIG-GUID: VO95h3wHVlqDXXsULF3XDAx5hGTRiUI_
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a44c9b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=4/OApUm1v7sVY8kc7hZvWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Z9vnt9DBQu4Rfwh2U9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VO95h3wHVlqDXXsULF3XDAx5hGTRiUI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010131

Hi Bart,

On 2/28/2026 3:31 AM, Bart Van Assche wrote:
> On 2/27/26 8:07 AM, Can Guo wrote:
>> Before power mode change to a target power mode, TX Equalzation Training
>
> "Equalzation" -> "Equalization"
Done.
>
>> (EQTR) needs be done for that target power mode. In addition, before TX
>> EQTR we need to change the power mode to HS-G1. These cannot happen
>> before the vops pwr_change_notify(PRE_CHANGE) because we don't know the
>> negotiated target power mode yet. It is neither approprite if all these
>> happen post the vops pwr_change_notify(PRE_CHANGE) as we are going to
>> change the power mode to HS-G1 for TX EQTR.
>
> approprite -> appropriate
Done.
>
> Additionally, if "neither" occurs in a sentence, "nor" should occur in
> the same sentence. I don't see "nor" in the above sentence?
Will improve the commit message in next version.
>
>> Introduce a new ufshcd vops negotiate_pwr_mode(), so that TX EQTR can be
>> done after vops negotiate_pwr_mode() and before vops 
>> pwr_change_notify().
>
> This patch does much more than only introducing a new vendor operation.
> Please make sure the patch description is complete.
Done.
>
>> -    return -ENOTSUPP;
>> +    return -EOPNOTSUPP;
>
> Why has ENOTSUPP been changed into EOPNOTSUPP?
I got a warning from checkpatch.pl when I add the new vops, so I changed 
the same for
ufshcd_vops_pwr_change_notify() too.

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#59: FILE: drivers/ufs/core/ufshcd-priv.h:178:
+       return -ENOTSUPP;
>
>> -static int ufshcd_change_power_mode(struct ufs_hba *hba,
>> -                 struct ufs_pa_layer_attr *pwr_mode)
>> +static int __ufshcd_change_power_mode(struct ufs_hba *hba,
>> +                      struct ufs_pa_layer_attr *pwr_mode)
>>   {
>>       int ret;
>
> The double underscore prefix is typically used in the Linux kernel to
> indicate that the caller holds a lock. That is not the case here. Please
> choose another name for this function, e.g.
> ufshcd_dme_change_power_mode().
Done.
>
> Thanks,
>
> Bart.

