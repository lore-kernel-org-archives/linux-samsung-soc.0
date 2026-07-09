Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AAA404BE8
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587159; cv=none; b=m7y0V5dAz4vQCVgAucJyEzfkYt4moNyov/PczcOmA8eQ3scPRoLhnELG2umZhd4L6Kxa0RR8mspPbHHrs3pai1wtniGbkSdeV3lR2fsJV5myvkU9gnKSfNrry2SWMTQ9ODgXgdjOxOpjBbcF8C29nMBbp01vYDv1rmN5luBDUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587159; c=relaxed/simple;
	bh=2YWoTGdh1uPJDsAWXvdO2XY3imgG92dVuK6XwOuZ5cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMBPnBnD6DHjNYh+hvF8KW7GJBoPr2ZSeipOH3A1xzgniejt87NWWs3IybQ/a1OZwcJgo1iw0rvq7IghynxuzlEbPBwAih+tryPDDTa+DUIAQolsUt3ex0X4nmxZJSunDzsnefvoPIGMhs15E7CTikGn2ofX93BARf/9UEz+xHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzmdtsv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0/m848K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzmdtsv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0/m848K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HJI749792
	for <linux-samsung-soc@vger.kernel.org>; Thu, 9 Jul 2026 08:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=Vzmdtsv4Src4CMvg
	+mFiVwhDKpcjFXB+283QlPlKGH7IQKguo85jTg+HFc3wFGFSuuFLnxHQD9qv13PT
	7S/sayDY1+nx3mQ+hrAmpfkiafgteB8eT/y1X7YqJ+Eba5l+mKRfu78/Ot+e4G0l
	EhYIj072MvUflHuGCsTuuAjTg9QPrN2PiP8PCLjsPtjtqSZPvSc7kU0DnOE0ve+K
	Qq48+7qHO0c6pa/Qvx74sBAV2AN0fhnLy5O6H80paJOOaM4aoupOkuMRcTkk/itQ
	bnQYmf71v/cDQDxbjQ4xbE3vJX/+XYZFx1EUV5VsL/gdRSaIpkx/6CXvCjuAEvU/
	amWFRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft88v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:52:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso14653385ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587156; x=1784191956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=f0/m848K2KD2l/X1dgmMU/dTJwJpfpO1GjJ0y7zrdsCYwxab948JT/SR/TdRSY4h3f
         BJBYjUoQi6oXvJqAlwdgySgJ/NCCM59qMAYp/uSIb1HDRvJ0lJb8RdQaCnwoRzVJc07R
         Jj65TBAS19pJrYMtXtO2tO+hYNcU//sHnhnn58ENxt75qpQNK/7Sy4Ez5pddqkGEuny8
         3Ud6c88h9+1Ft7kG4m+g5kl8de7gshyBYazapcrtlx7haXf6HIFK2J9iCp2hOFB4eeEA
         Cqx3iCBGypN1oUF/EkBEsF4x0g3pz4ceeOXOmWnxMedqKSjzFQlso6CEtCM00WoPmt4r
         2ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587156; x=1784191956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=AUrbD8Xm3puYsKOGduk8dos9tVZwwSjM/XsjTXW4CGrXRutgFbxNUDnGsgZVEALko7
         dgcBJgREWQ7/2+jJ8HBr1Ezes5b+ph3yd0e5tzkr58dLuR9Fi6K6pauYP3ImG66W+xWo
         Ch9khGzxM1HRw2k/qAH7bo8q8KA1qz1tAhkBsCk+nxIoNsaU9ZsPKTo3XujolriWv7qH
         uH5qGBC8nUvGnOnFthQdoxzAuk88OxTAJG9Ur7+lOUEUtoqQi3dBc4VN8anFHJrjmMU0
         Y3n12ZDtoceyzEqnXeNWIZNrTdTy7KZr3ZXVX+0/U3aFRVCqhH36UFl4LpWf+G6aUJTF
         J5Bw==
X-Forwarded-Encrypted: i=1; AHgh+RqWOkk8gH3FU/l8W/6ZN7+vhq1jqQWGq9QHEH2qXYJXQ7iJ1WLAlPPBCtUddUFn0sivbN9tRJWlwDpGY3mawt1XHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSX9pxRuxwSKUYm9K74LWxZMYkk0hblGC2b43ZcFQC2Os0WTne
	RvvwJG4Bb+ANvKc6WHojWiBAXUNXSe3a28ekV9wJJPeueI6v0TJr2S9leq4XSYly+bQm2lgjSs9
	D7W3RnwJDsr5yiocZZMNNPvUicAkPbh7Zir3G5KKvGLtegLTxCGOqlNIlzOFdWwg4m8xbVW4rYw
	==
X-Gm-Gg: AfdE7clJEk76xiu2WS9ll6qBsh0ZlkHAlKohXqW0Ks/OR1EE4/BghI/Jv7r1y5BIXC/
	IDSW/h/Qgjp0kDBosVI0X7WForapqaSwY1Smkp5iZ1S+3B3UbFt63arP8OTdsUa9Aao/OpNUosC
	QHkZIhC5cMpv2EDO+zMcc3EsP2GRYa7EYqT5Hp8ZrZkXl3Qkr7wj0SF3FxjAtcGdQ84zYRbEafi
	T4+4rJZubvAi6m24h3PxnGdJMxWjgaDgYtC/ipjdWboqcuGuTUw2p4YWUZR7/AT6LUBwR8cekqV
	IIZ6upj0pPRJK+hko12xKYB5fUr6uHwr8iCkn8pNIdH1pdBjwcMQ1CLJ08PJvh0kXMK+1+bYA2U
	BnavgkEKVUdj1/vYXlsWJ/3h8tA7Yw4ugmZfMAyAizr4=
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22278535ad.5.1783587155506;
        Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22277765ad.5.1783587154710;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d946sm40530765ad.66.2026.07.09.01.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Message-ID: <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:22:17 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
To: Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX6xiSdXVEeRKt
 PQLfzik/BDC0a3l0Q69h1fwohoS9FNKsD5tfcc4qtEx61nA5kyOEt7QqI2w6kYFzlf2KDOEPbEB
 A6f2FzWuO5AhSD4mN87HIVVoLSLijx4LoZQgMfeQJ5Fv5uq0u4jHNhCeT/wkhfYAr4mypwEEGee
 cvCcIzFs5oX2+xaZgMwuD8HK8hUHakrx1q9rUOHKIF57WKh+4c5XZg6dx8ROItJiA0zoNAJs8tm
 nJnRYxtX+XIWfkn7QLFH553nULnLw4MdEzxwPHAADDwjSB0vh4DlED8SmM3t3x+JkF44P+EwNbE
 hsjdMvGWy9NEoC357vF03IlqUYlEguOBsqV54ksONfAXUeWSX1cmNjZAXBBXDjlbfBqW5ROyiok
 ZZImMg89KB01uMiIxk+KP8nWXF99uiHxDUwyZmI/7Ij5ZWQl8kaRT+tr58+oxRHvcm7Vx/yL6Ls
 DOKGB9d1K83gz++imEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXyrrvjV+LDqxD
 H1XjIAV8bs4NTTeMKIlcLJggcapNW7ovWdh011nl4pIxWG5P71WRH3d6rWoL8ieAmtS9tTtCPlf
 fNHAF5dm1cma0Bb+ndfkD0RZe3Ok99g=
X-Proofpoint-ORIG-GUID: ZV-lrwQDJEKqNJtzfyqD6xqDaAl60XUU
X-Proofpoint-GUID: ZV-lrwQDJEKqNJtzfyqD6xqDaAl60XUU
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f6154 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=yxy72PdV_TLAuk9cO2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

HI Jiri

On 09-07-2026 12:23, Jiri Slaby wrote:
> On 09. 07. 26, 8:25, Praveen Talari wrote:
>> The uart_ops.pm callback has been declared void since its introduction,
>> which means any error from a driver's power management implementation is
>> silently discarded by uart_change_pm(). Beyond losing the error
>> information, uart_change_pm() unconditionally updates state->pm_state
>> even when the underlying hardware transition failed. This causes the
>> serial core to track a power state that does not reflect reality:
>> subsequent calls to uart_change_pm() see the stale cached state as
>> matching the requested state and skip the callback entirely, leaving the
>> hardware permanently stuck with no further recovery attempt.
>>
>> On modern platforms where the .pm callback performs real work —
>> enabling clock trees, interacting with runtime PM, asserting voltage
>> regulators — this is a correctness gap. Failures are invisible to the
>> PM framework, the port proceeds to call ops->startup() on potentially
>> unpowered hardware, and suspend/resume errors are hidden from the core
>> that needs to handle them.
>>
>> This series fixes the problem in four steps:
>>
>>    Patch 1 changes the uart_ops.pm callback signature from void to int,
>>    updates uart_change_pm() to propagate errors and only commit
>>    state->pm_state on success, and handles the return value at every
>>    call site in serial_core.c with appropriate policy per context
>>    (propagate, log, or skip-on-failure).
>
> So does this break build without the below applied? IOW: breaks 
> bisectability?

You are right, patch 1 alone breaks the build since the driver 
implementations are still void until patches 2–4. The series as 
structured is not bisect-safe.

Do you have any suggestions on how to fix this issue?

>
>>    Patch 2 updates the 8250 driver family: serial8250_do_pm() and
>>    serial8250_pm() are updated to return int (with the exported symbol
>>    declaration updated in serial_8250.h), and the 8250 sub-driver
>>    pm callbacks are updated to return 0.
>>
>>    Patch 3 updates the remaining non-8250 serial drivers. All .pm
>>    implementations are updated to return 0. The sh-sci forward
>>    declaration shared with rsci is also updated.
>>
>>    Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
>>    OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
>>    MIPS/Alchemy (alchemy_8250_pm).
>>
>> All existing .pm implementations return 0, so there is no functional
>> change for any current driver. The series purely adds the infrastructure
>> for drivers to report errors going forward, with the serial core ready
>> to handle them correctly.
>
> OK, now I miss the rationale behind the patchset. Neither there is a 
> possible code path to actually test this?
The rationale is that qcom_geni_serial_pm() calls 
pm_runtime_resume_and_get() which can fail, but its return value is 
currently discarded because the callback is void. Patch 6 in this series 
is the concrete user: it makes qcom_geni_serial_pm() propagate the 
pm_runtime_resume_and_get() error so that a failure to resume the UART 
power domain is visible at uart_port_startup() time rather than silently 
proceeding to call ops->startup() on an unpowered port.

A code path to test: on qcom platforms with CONFIG_SERIAL_QCOM_GENI 
enabled, if pm_runtime_resume_and_get() fails during 
uart_configure_port() or uart_port_startup(), the error now propagates 
to the caller instead of being dropped. The test case from development 
was injecting a failure in qcom_geni_serial_pm() and observing that 
uart_add_one_port() returns an error rather than proceeding silently.

Thanks,

Praveen Talari

>
> thanks,
