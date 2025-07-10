Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210EF2EFDB8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752167370; cv=none; b=LAOokOgXYAwWymOb+4G1Z3faN1P/IjxiDyeRvvmMPk05+0dBu6tGYgZJ9vGH5LVI/n8TFJ/M/8IYtwfqZZsNpPqzNfarTUTLRKxfInRCRflNLF+0jW4eu5kM7auyVjY9ILRUTgVLe8Id2hVGA9axRi6U/SzJ2V+rfy22u4Cu26E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752167370; c=relaxed/simple;
	bh=bX26n5oj4nFF66IMS1a1thqUPx5FE9suBFewbI9LjwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pr+mPUL+DWGjvASzWsTdYofFSTStMQoCvUyI7aqCOi1bEc3VdVot8C7GjW16Br0jciC0NgbrljUPWaze4CIJToAl1B5zC8Zrp6tUQAR3Wnl8GzbJPcGMDANJDqc7B8VA5dzhSwKtGTftmTNTiLdDJhhS3UeC4KuN7CxCp23fkmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oo7fgUrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oo7fgUrp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9H5Uf002945
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 17:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWmxA5sn5vjlQlJk6Gk2PXEf7FTIDLAmp/VpEE8iWrI=; b=oo7fgUrpvtc3dhhK
	0T0vkuIUQP41oiDWGY9IbzBL/tykA0KdQNaylvpqhssFBbFZV16y014cwgRxB798
	2tVbVY00Ezmag81MRTPfoV9JbThCjFxGg4BF56XJbSmBrPHIzl3G3Bg0uhkVL35w
	YLi9hIlK+YyROU+J23W6L0nVz74QQbTquyOi5H52ofn1KNulkRXEpLJSX8vwYrCB
	CIe/KXtEOsscl+8KE9Ny4Ua4xiT5JooJNUCZPanC9yATDEntH6PziMxW9f121KBN
	fX+j01DCRtJieQ2ejoMTjJcreHOzC2dMxfMOiBS3IKTNXgvZwnkR8xTBCdr1JuWJ
	HtOPzQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bh15u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 17:09:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ad608d60aso1038999b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 10:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752167367; x=1752772167;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWmxA5sn5vjlQlJk6Gk2PXEf7FTIDLAmp/VpEE8iWrI=;
        b=eN93ekBWLTZfCqoY9+hvvY1NFWq5z1jDQdFJygz8l20eiDyzf4EGC4McG1ogxh59rr
         DoHlZi1dtosxiM+tZ0RN+N1U2FKOFz27/icpSowqOvxppNzO91V/FebBVW7J71fAfnnt
         4vxdB44lcMZXAybYMBNo9gUpFiNvHx94UnGiEjU2bmE5kkN7OToypE+JiBvIaDxONXX/
         GCv4lHh6/yn3OYUI/aG1WnNDekaEKNlwgY+j0ghbKuIGFr5+y/mkDyEQ4u8C7Xy58V5H
         molUtXF6Fdid1bx7cMFTxVkO/jZW7RobmMuRer7HKpEliFSMGJwvM7wj5VSqosskK0TG
         FXCw==
X-Forwarded-Encrypted: i=1; AJvYcCU0bi7OBX2X+eIeR+Lp/VN0gesvtnMoBc7FCcd9xZy/yaJhKIs0YEs2IH8BR7j+vYA+KDfPEdSCgXiWOk7Z+dBRTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7WEJcD5ExmwU/mTEC4CMJLCFUEHOqPLJ0g2r9GnwCOR5OsVD
	VY/fgyIoYP0Wre2ZzcEZdIIGbl1uxh5+DN6XVrwgPb5pYSlkgyd836od65Po6fTTuNSfStTt1DQ
	vrMvNWtBF3FxA7kbbNwEi3Rdk1XL5MD18L4RAXwYgUAmPtpQW8urJzxYKiHOXlNAD6gZQYD3SWw
	==
X-Gm-Gg: ASbGnctR6O9jzdC/r3TF0JMXYcFYrLO66ofTGWuxGwh+Qrb2UNqwpKeEMC5YKjg9kqF
	2C7EGYQrRfL50+aPekPD2ilMsOHT4ym0yGFzfXxF2SDgSUpCkyki+f9oZn9bSYdDGLvzN8CeTMb
	Fgvk8DmviPVjkcxoUthnyIKQv5aNbiHuSp+nToOvM7w1nnA2ZoAtFVLznGTmfe0ihA3OykdFtjN
	kbJo4by0T30VNyd1/ZQRsyJy6mbrEcpAlujlqAANbI4H9fgvyS9sGZwuTdIkeMyEVArkXStOji3
	mZNdygKRZpCtwL6tn3hwK4OWpW7t60myUg7/HX37xp0K/575XgrZHR2Q
X-Received: by 2002:a05:6a00:4b51:b0:740:6f69:dce9 with SMTP id d2e1a72fcca58-74eb511e59cmr6723753b3a.0.1752167366596;
        Thu, 10 Jul 2025 10:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6yyaD+nbh3URkXYCkkrnIzGdUyrZ/RyzS7InK/GHkNSGhxPfxxfMUdFX9o5B9W07nRBLyMQ==
X-Received: by 2002:a05:6a00:4b51:b0:740:6f69:dce9 with SMTP id d2e1a72fcca58-74eb511e59cmr6723701b3a.0.1752167366067;
        Thu, 10 Jul 2025 10:09:26 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f99d37sm2709535b3a.178.2025.07.10.10.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 10:09:25 -0700 (PDT)
Message-ID: <f0644bef-57d9-7a62-3dc9-18f39f30fcc1@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:39:17 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Feedback - [PATCH v10 00/10] Implement vendor resets for PSCI
 SYSTEM_RESET2
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andre Draszik <andre.draszik@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        mukesh.ojha@oss.qualcomm.com, kaushal.kumar@oss.qualcomm.com
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0NSBTYWx0ZWRfXwrhlrDHYCSiM
 JSHbqNJQssNgjlA9/JVJRz1mAfDVjQ9CpOF2kG+NrvZEUDhtnb0lpIaECqpfeUCwnrKc2+Sr1Qc
 LCnE6bgkk/+0e++Kb6dFjv6kt8gGt7vuB9rsrW6z5PrzhaWPcLREt2Buw1v2QPjhvQH5moWdA9D
 7VpP4vRfeEz5CTXg31PWB7wxsD3NGbvUpl+0ISeCW88GVOmonCI5hTdMn8bsY+gqnoGuevpGpvR
 fwByD9zZ17yW++3QzJAPTlsAqVUcrRZyin8DVVeFFvgsm2meUkaj8X1nD01VtwHAhL26kgtWIpm
 acbpL5MNGhR2Ad8HQZGRxi6WGn6XFyoyGeGDoOUCAROzcdJZBRIFtXb+fCzZ0ByrWN9bBBiP4SB
 hiFcZOeqfwmJZeuqpei/Bf6NR3R2VmU+82u4v0do86B/1zpKGd/BWiaCnPjidOdxMW2Bm7El
X-Proofpoint-ORIG-GUID: YcJq185eQYMel_MweJL9LDEnO-zJnHsy
X-Proofpoint-GUID: YcJq185eQYMel_MweJL9LDEnO-zJnHsy
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686ff3c8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=PpRZJuEF3knEMB6C7y0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100145

While this patchset is being discussed publicly and will take
its own course, Maintainers have raised an important point and
are seeking feedback from SoC vendors on the supported list of
reboot commands, hence, this email.
--
Should the list of vendor-specific reset commands be
kept open—allowing vendors to freely define their own—or restricted
to a closed, well-defined set of commands with specific purposes?
If needed, naming constraints can be enforced via device tree bindings
for vendor resets, providing a consistent interface and minimizing
conflicts.
--

V10: https://lore.kernel.org/all/20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com/

thanks,
Shivendra

On 7/10/2025 2:45 PM, Shivendra Pratap wrote:
> The PSCI SYSTEM_RESET2 call allows vendor firmware to define
> additional reset types which could be mapped to the reboot
> argument.
>  
> User-space should be able to reboot a device into different
> operational boot-states supported by underlying bootloader and
> firmware. Generally, some HW registers need to be written, based
> on which the bootloader and firmware decide the next boot state
> of device, after the reset. For example, a requirement on
> Qualcomm platforms may state that reboot with "bootloader"
> command, should reboot the device into bootloader flashing mode
> and reboot with “edl” command, should reboot the device into an
> Emergency flashing mode.  Setting up such reboots on Qualcomm
> devices can be inconsistent across SoC platforms and may require
> setting different HW registers, where some of these registers may
> not be accessible to HLOS. These knobs evolve over product
> generations and require more drivers.  PSCI defines a
> vendor-specific reset in SYSTEM_RESET2 spec, which enables the
> firmware to take care of underlying setting for any such
> supported vendor-specific reboot. Qualcomm firmwares are
> beginning to support and expose PSCI SYSTEM_RESET2
> vendor-specific reset types to simplify driver requirements from
> Linux. With such support added in the firmware, we now need a
> Linux interface which can make use of the firmware calls for PSCI
> vendor-specific resets. This will align such reboot requirement
> across platforms and vendors.
>  
> The current psci driver supports two types of resets –
> SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
> patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
> into the reset path of the psci driver and aligns it to work with
> reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
> with a supported string-based command in “*arg”.
> 
> The patchset uses reboot-mode based commands, to define the
> supported vendor reset-types commands in psci device tree node
> and registers these commands with the reboot-mode framework.
> 
> The PSCI vendor-specific reset takes two arguments, being,
> reset_type and cookie as defined by the spec. As the
> vendor-specific reset needs two arguments reset_type and cookie
> to be passes to the firmware, enhance the reboot-mode framework
> to support two arguments (magic and cookie), for each reboot-mode
> command, where cookie will be optional.
> 
> Along this line, the patchset also extends the reboot-mode
> framework to add a non-device-based registration function which
> will allow drivers to register using DT node, while keeping
> backward compatibility for existing users of reboot-mode. This
> will enable psci driver to register for reboot-mode and implement
> a write_with_cookie function which will save the
> magic(reset_type) and cookie and then use it in psci reset path
> to make a vendor-specific reset call into the firmware. In
> addition, the patchset will expose a sysfs entry interface within
> reboot-mode which can be used by userspace to view the supported
> reboot-mode commands.
> 
> The list of vendor-specific reset commands remains open due to
> divergent requirements across vendors, but this can be
> streamlined and standardized through dedicated device tree
> bindings.
> 
> Currently three drivers register with reboot-mode framework -
> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
> list of commands currently added across various vendor DTs:
>  mode-loader
>  mode-normal 
>  mode-bootloader
>  mode-charge
>  mode-fastboot
>  mode-reboot-ab-update
>  mode-recovery
>  mode-rescue
>  mode-shutdown-thermal
>  mode-shutdown-thermal-battery
> 
> Detailed list of commands being used by syscon-reboot-mode:
>     arm64/boot/dts/exynos/exynosautov9.dtsi:
> 	mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
> 	mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
> 	mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
> 
>     arm64/boot/dts/exynos/google/gs101.dtsi:
>     	mode-bootloader = <0xfc>;
>     	mode-charge = <0x0a>;
>     	mode-fastboot = <0xfa>;
>     	mode-reboot-ab-update = <0x52>;
>     	mode-recovery = <0xff>;
>     	mode-rescue = <0xf9>;
>     	mode-shutdown-thermal = <0x51>;
>     	mode-shutdown-thermal-battery = <0x51>;
> 
>     arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>     	mode-normal = <0x77665501>;
>     	mode-bootloader = <0x77665500>;
>     	mode-recovery = <0x77665502>;
> 
>     arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>     	mode-normal = <0x77665501>;
>     	mode-bootloader = <0x77665500>;
>     	mode-recovery = <0x77665502>;
> 
>     arm64/boot/dts/rockchip/px30.dtsi:
>     	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>     	mode-fastboot = <BOOT_FASTBOOT>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-recovery = <BOOT_RECOVERY>;
> 
>     arm64/boot/dts/rockchip/rk3308.dtsi:			
>     	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-recovery = <BOOT_RECOVERY>;
>     	mode-fastboot = <BOOT_FASTBOOT>;
> 
>     arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
> 			mode-recovery = <BOOT_RECOVERY>;
> 			mode-bootloader = <BOOT_FASTBOOT>;
> 
> Detailed list of commands being used by nvmem-reboot-mode:
>     arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
> 			mode-recovery = <0x01>;
> 			mode-bootloader = <0x02>;
> 
> Previous discussions around SYSTEM_RESET2:
> - https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
> - https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> Changes in V10:
> - Change in reset-type binding to make cookie as a mandatory
>   argument.
> - Change reboot-mode binding to support additional argument
>   "cookie".
>  From Lorenzo:
> - Use reboot-mode framework for implementing vendor-resets.  
> - Modify reboot-mode framework to support two arguments
>   (magic and cookie).
> - Expose sysfs for supported reboot-modes commands.
> - List out all existing reboot-mode commands and their users.
>    - Added this to cover letter.
>  From Dmitry:
> - Modify reboot-mode to support non-device based registration.
> - Modify reboot-mode to create a class and device to expose
>   sysfs interface.
> - Link to v9: https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
> 
> Changes in v9:
> - Don't fallback to architecturally defined resets from Lorenzo.
> - Link to v8: https://lore.kernel.org/r/20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com
> 
> Changes in v8:
> - Code style nits from Stephen
> - Add rb3gen2
> - Link to v7: https://lore.kernel.org/r/20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com
> 
> Changes in v7:
> - Code style nits from Stephen
> - Dropped unnecessary hunk from the sa8775p-ride patch
> - Link to v6: https://lore.kernel.org/r/20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com
> 
> Changes in v6:
> - Rebase to v6.11 and fix trivial conflicts in qcm6490-idp
> - Add sa8775p-ride support (same as qcm6490-idp)
> - Link to v5: https://lore.kernel.org/r/20240617-arm-psci-system_reset2-vendor-reboots-v5-0-086950f650c8@quicinc.com
> 
> Changes in v5:
> - Drop the nested "items" in prep for future dtschema tools
> - Link to v4: https://lore.kernel.org/r/20240611-arm-psci-system_reset2-vendor-reboots-v4-0-98f55aa74ae8@quicinc.com
> 
> Changes in v4:
> - Change mode- properties from uint32-matrix to uint32-array
> - Restructure the reset-types node so only the restriction is in the
>   if/then schemas and not the entire definition
> - Link to v3: https://lore.kernel.org/r/20240515-arm-psci-system_reset2-vendor-reboots-v3-0-16dd4f9c0ab4@quicinc.com
> 
> Changes in v3:
> - Limit outer number of items to 1 for mode-* properties
> - Move the reboot-mode for psci under a subnode "reset-types"
> - Fix the DT node in qcm6490-idp so it doesn't overwrite the one from
>   sc7820.dtsi
> - Link to v2: https://lore.kernel.org/r/20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com
> 
> Changes in v2:
> - Fixes to schema as suggested by Rob and Krzysztof
> - Add qcm6490 idp as first Qualcomm device to support
> - Link to v1: https://lore.kernel.org/r/20231117-arm-psci-system_reset2-vendor-reboots-v1-0-03c4612153e2@quicinc.com
> 
> Changes in v1:
> - Reference reboot-mode bindings as suggeted by Rob.
> - Link to RFC: https://lore.kernel.org/r/20231030-arm-psci-system_reset2-vendor-reboots-v1-0-dcdd63352ad1@quicinc.com
> 
> ---
> Elliot Berman (4):
>       dt-bindings: arm: Document reboot mode magic
>       arm64: dts: qcom: qcm6490-idp: Add PSCI SYSTEM_RESET2 types
>       arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI SYSTEM_RESET2 types
>       arm64: dts: qcom: sa8775p-ride: Add PSCI SYSTEM_RESET2 types
> 
> Shivendra Pratap (6):
>       power: reset: reboot-mode: Add device tree node-based registration
>       dt-bindings: power: reset: Document reboot-mode cookie
>       power: reset: reboot-mode: Add optional cookie argument
>       firmware: psci: Implement vendor-specific reset-types as reboot-mode
>       Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
>       power: reset: reboot-mode: Expose sysfs for registered arguments
> 
>  .../testing/sysfs-class-reboot-mode-reboot_modes   |  39 ++++++
>  Documentation/devicetree/bindings/arm/psci.yaml    |  41 ++++++
>  .../bindings/power/reset/reboot-mode.yaml          |  12 +-
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   7 ++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 ++
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   7 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   2 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
>  drivers/firmware/psci/Kconfig                      |   1 +
>  drivers/firmware/psci/psci.c                       |  53 +++++++-
>  drivers/power/reset/reboot-mode.c                  | 140 +++++++++++++++++----
>  include/linux/reboot-mode.h                        |   5 +-
>  12 files changed, 280 insertions(+), 36 deletions(-)
> ---
> base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
> 
> Best regards,
