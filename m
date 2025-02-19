Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0EA25A2D6;
	Wed, 19 Feb 2025 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740004705; cv=fail; b=WCjfM6eKLSlRWYHFT86J0Yu23q02NpLJ2YFVZgaGlFYvRcItG+NxkHWeEWVa1D9CgD96b76b+b7oq7aPgJ//oHvgi3UOvecKUqXLaihUgu60VjXNBIUFG8c9zJNjUgEi9aR9bWcJ12/2ks/pi+7BTt93QTcrnoWMKLkjyn1Dp40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740004705; c=relaxed/simple;
	bh=QSkAVEH5QuSsdZnmKQBh8iiTtk1SNh033iDIKiCCNlA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R0SMmVM1L4+nihNNXg2in9IUc1pRKa7qlEi2qpk8A3Md/q+e5+amB5kvNr/TzyXYQ6dVrSuAeIwPhcL4itrdnFC8sJHQT8FUIV/Hoo6CmWIFeMo7PlsLSSFumGKGZ4zwvTAHHVs7vBlhxIwrDr5gnqUopy78HUqRynC5GZ3HURI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=G5Ohribf; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dhrl9GRa; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dnx3OtsH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G5Ohribf";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dhrl9GRa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dnx3OtsH"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JM8fCP031667;
	Wed, 19 Feb 2025 14:38:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=QSkAVEH5QuSsdZnmKQBh8iiTtk1SNh033iDIKiCCNlA=; b=
	G5OhribfI+eYyOqb743k5/7i++u3NXmBcAt10+4vjub2YCzdcl2UfcH8kLa+xCT+
	mNvZysDFiStv1Oe95P4VL0vpo8xQdLJt/pm3JvF3EGV33OMl07SkknE2CXeDGxBZ
	5gqo3r1dG+VE7fOezItFI2L7+7HB7vVDnVwpayH2HSUIKVY65MQTBc72vBB0uc1J
	3cQaGA1ywkPm7L3hR5x3mFBt+ifaFH9lMmbnrD403mV9eMQJzL5I22z6vOVWXiQg
	YODSEh9dBEdUd+mtC1fJlUlBJqHuWr8A3NPi+FxDLvIKlPBC/JA0+Br7OrpEnD7b
	oE18mjMGZlKbz8YhE0RIMA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44w00hyrfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 14:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1740004680; bh=QSkAVEH5QuSsdZnmKQBh8iiTtk1SNh033iDIKiCCNlA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dhrl9GRaYVDlZvo/8GShSE77z/ep3TkrM01Aa4P70sbvsYdYEPKlkkNmsOZDUa9Ik
	 jvWAA6CtIpTe8DvrOh8PiCSNvLnxIJ8odQjvlkYH6V9o/TASM9GRq+ud1Fe4XXazgB
	 6dfYGtQH5LVrZ4oE7QaVhIj5zia63uXa+tVCTAdkxWWfSMtdcs3KsTksz/kxKC9V1M
	 5YPi4tBEqtw9PdSom0GxBG9NFA7L1Jkj5fmTRaVDF+0bPcy+TCaeaLFttf0YilIGDB
	 2QiKEBX3vscJr17xE1mH/Un9w+oi3X4HTaLpugpJ1n/XmqBdw5Q8qJTqYXfxZDVcTI
	 m1L/YO4FgnNMQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3C12E40353;
	Wed, 19 Feb 2025 22:37:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 24AF1A0063;
	Wed, 19 Feb 2025 22:37:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dnx3OtsH;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5CB2040353;
	Wed, 19 Feb 2025 22:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6TlRfpCOTNiOqKdIJTkXWG3s7yvZJofIIxNMKQzzxlIDGOA4+j9cZzoVnRO6EoQ3bKiWoyuCD9sZHUzJVrz2nE8B3JJFeKyxz2VachKYt/QClNvE7bsN1w/Y0iJoEiijz5UUcKDIEOkt/Y8KdJlfbJ/u5FnauM0fSDri/HUQiE6uHJHWFgy+igQxu9XDPrIr2XcpXWsa0SlcmVNK9zjjvmO2d9qlAoUCrEi2hlyjR1DPCS1nZVV71o5qiCX7pHj2DEyBTrBeGAtblb3kG/oL+5MKbDuMSv7304MxkKYa2IBUnrnLwcC69yCPc4GEie3hy7CQ0xkMWijJhmog3hAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSkAVEH5QuSsdZnmKQBh8iiTtk1SNh033iDIKiCCNlA=;
 b=qLaHVLj0l/5R3qPuvMjRd+BHJm/ZdT+ixjefJD7iejNNgtT0FwDB2lSgD2z2A5ET6414TDITYvOMX00UFE46aejxIkex2w0kzhhbvLF1oAnAj0UDFwH1Z21wtWS2r7PhzS/yR0+IbrIDcyyzORGyfW0OFSJiicbxGp98JQoj+MP6fzmqB1nw4bipVS9INTDwD2utFR3ztcRqKGmgEs9UCwntbCJWEj8b0bgIY/RnNWiHS8+f/xfbwlYTlc3/vHZQgwNA+AccaPCGwR2i3XqMagDMNmb9G9+8rONHtCHKu0gDTKjzx9yppZhzx0p7wDYCD7X1MT5ufkH4Zu/ErLWT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSkAVEH5QuSsdZnmKQBh8iiTtk1SNh033iDIKiCCNlA=;
 b=dnx3OtsHi7grJ1EQiU6MN+jUlWuOKN6NifUekyFAD+W1XnHA8018fQSoTGSt5D0xgVH0aQwRD6cn7ImghHx7vKvorXoNw616ywu4I8bzu/4mn1fLwnlLHsCJnCW/t7sRros8hlgjHB/jIngWxsRjXnlT4o4deeb2t1KOsbCMxJI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Wed, 19 Feb 2025 22:37:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 22:37:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] usb: dwc3: exynos: add support for Exynos2200
 variant
Thread-Topic: [PATCH v1 2/2] usb: dwc3: exynos: add support for Exynos2200
 variant
Thread-Index: AQHbf6YK2NFb6VB72USlQ7+jcdeJerNPPnuA
Date: Wed, 19 Feb 2025 22:37:51 +0000
Message-ID: <20250219223743.zpmoe6u57d54kl5m@synopsys.com>
References: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215123453.163434-3-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215123453.163434-3-ivo.ivanov.ivanov1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6390:EE_
x-ms-office365-filtering-correlation-id: db864e6f-cf2d-4b16-b6f3-08dd51360b3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L0Qrd2daRldrL1J2Z1dpaERDWG1FZXcvcE9iTUZXQXNxZmEvbFhCRVRkVGhB?=
 =?utf-8?B?NzNHQTRPQjZFa3VIS2FQcmxSMlplQkt0ZDJHam9qaW1BajI0VnVDVE5DU2Zu?=
 =?utf-8?B?Qkd4Wm56akU5UVRtVSsvR3d3ekpvVlhtOHZTMm8vbFphUXE3RFEzdlhOak91?=
 =?utf-8?B?WjJCb0FzVy9maDB0V3N4c05ORHBBQ1lRc0oxWm8wZklBWC85ZmVtWXV3RXNS?=
 =?utf-8?B?UHVVVVZmK09JanN0NVRsRDdQVVBBc0c5MmQ5cGNpK0kvNzd1SVdtM1ZyNkc4?=
 =?utf-8?B?OFNoRWp0eUx5U212dXVPcGUrWnQ4WWh2VWczSCtlVWJscUdHRFByWWxFZUxX?=
 =?utf-8?B?UG1Ua2tKZFVDNGR5L2JLdUhIbk1uc3ovWU84ZHNzdEtCeWJQcFBpcHRmOW9q?=
 =?utf-8?B?ZSt5Zzdua3JNMjNJbFcyZmVrNVhhMHlxV3dYSUVQSWpPaUpjbHJTczFZVXZZ?=
 =?utf-8?B?Y0MxUnJJQStKV1RpcTZ6blh3WHFqNklmR2RnZ1dLYWd1UWNNUlo5T3F5dS8v?=
 =?utf-8?B?eFpFVzFrUDRUWk9pbDdQSjlCaHF2YmVRQzFvUElqZHBJUk5TM3Z6bC9sQUVD?=
 =?utf-8?B?Q2wxVkdEZWZDNWhwNUpGR2pJNWNZTlpzVGVyRU4vZzVKajUrd2k0NFphOWNU?=
 =?utf-8?B?d1FGTTROZ0NZdjFLRFZJaUtjcTFVQnJaQndrVEZ3VU8xODBpbTNBYjZSZlFw?=
 =?utf-8?B?Z3F5QlkxR2FCZjYzeXdtSVF6L3YyM2dUU2lwdG0wWTlKUGtwVms2T0ZHQmVI?=
 =?utf-8?B?ZzB0N290M29OVGJ6MEFKODl2S0FTS2pxdjQxV2xadHBYcEd5enBmNlB3RHpy?=
 =?utf-8?B?ejFidm5MN3hrcmtxNlZJV1d2YVNLNHRNa3BFMTJYclQ1Y01XK0FFZ0dpblp4?=
 =?utf-8?B?clprUk5hRW02OEdiM0tUa3QrQThNb1FzcE40NkNJVEVaOTZIQjNVT0V2NUUw?=
 =?utf-8?B?c3V4UnZLNTRoL2xpelg2enBmQ25rTmtpZzk0M0FHZDRkZzFCWGl6OGJzQjRl?=
 =?utf-8?B?ZnFpNHFwZEh2Y2xqRm1Xazg3Y1IxUFNnYTQzUllXMS8zNjBGM1k4WGJITFc2?=
 =?utf-8?B?ajQvaGJSNFRTamtSMGpDZ1BSVktEcWZBSXV3enhmZE5JYlppYzZTenBzV0t2?=
 =?utf-8?B?ckhrbTVOSkRWbEhCbTg0KzB1WjBtVFhXRDNXbFQ4UEh3VzIrb0kxcU1lS01N?=
 =?utf-8?B?enZLTzNrV0huSWlUK3RiOHpKU3JVODR5NGE3UWd5azJkME14dktMOWlxRWwy?=
 =?utf-8?B?NUpPMi9rMC8yc1I2YURQSS93SlE1MzBDZ29Vc0xjMERjU2QxYkQ2cXBBU0FC?=
 =?utf-8?B?ejJ5ZG90SnI3eEtHZHdkb0dabFdFSXhUTFJVdUVQQmRVaVVpeDByWm40N1Zz?=
 =?utf-8?B?N0pKRTYyeFVMU2dxL1VvQlZ2bEhncFNqdHV1S0dOS1BqZDBZOEpaeEpQMi9x?=
 =?utf-8?B?Y1NxeTVudXliOWw4dkp4QXlsMHQxSXZ0SmRVQ3o3NzdBZGpYTWlVTFlQU1NC?=
 =?utf-8?B?M3ZncDhuMkJxQ3Y2THp0VnpjcTJEbFJXeVIyN2d1R2kyaVBNeVV5MjRCY3Rk?=
 =?utf-8?B?OHNJUmFNVk9UeGRaSEJmeWJ2VVVINTJMVmlZMThhMlEzVERpUDJaTU10dDlN?=
 =?utf-8?B?RDJYOXNFbWJtZEJ6Rm90SHJOWXZiU0xqYjk4SG5qMm4xeURFbEJUSStnbXZz?=
 =?utf-8?B?T1JhSXNCZDBzenluem1iQzYweEVVaFk3NTA1clNyMXVodDBVWSs2S1BzcnBp?=
 =?utf-8?B?N3NYMEpzTjd2REpJYjRhQnpTSDdzYjMwYzJITXZDTTYxRVo0Ri9DcWoycWIx?=
 =?utf-8?B?dVJQYXRQU3plelhnZE0wMzlENnRnWlZYc0U3VFZKOS9mVWJrZm1OVi9PN1c2?=
 =?utf-8?B?aGEvaVJ2VjJNUXY2SnhUSVp6OHEwRDYyT3FaQjdVOWQ4VmEwV2Yyb2Y1WVNq?=
 =?utf-8?Q?FVH0tHXeFGSbGCms0zZ4mVwo5k88vO4k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dElnSnNVWHQzUFhXclkzVU5aRkw4VklOQi9oeFVwbEM1OURmU3pJQ1RxZ09n?=
 =?utf-8?B?TFB4UHkySkNTZ3JwTTV4cmFHc3ZEdGRKY1lrVmVzLzMrKy9iWkIxUkM0cGo4?=
 =?utf-8?B?bnZ0RUFpSTZqVEFNc09LZ0x2MkdKbUpCRDJ0SmVjeWdPNGFKcUUvNnBpZFpl?=
 =?utf-8?B?VitSdW5WOWh2SGdsd1ZwZURTbExWem1rTXBQSkRSSnFDZ2E4NmlMRHR3Qmpu?=
 =?utf-8?B?WXVPTnVoMUs1NlB0aVRTMDQvam81dEdrSDBkd29qdmpuY2VxTlA4eVlhMERu?=
 =?utf-8?B?cnlVd1JVWUhublAwN3RSMjhCaUlpTklTeTRPYnNlM290NWpYTi9nYkYrNlJZ?=
 =?utf-8?B?UGRuZFZucjlxd0hTSlNLM3JweHQ1SXVjTjZuUGJEeDBDSklGTDhNbWxwNVZs?=
 =?utf-8?B?eEtNUjJVQklmYko5d1BYQ0dZczI0bU1pSG9IU2hxNm9wNlc0UVJxZ21SYmdr?=
 =?utf-8?B?Y0RINjc2QmltSmkydk1wczRoNDJhWVRTMFVZRkUwZFpxaTViMmtrbTdSb0R4?=
 =?utf-8?B?eFVVQWZUT2pWa0NSM2ZrOUU2Y09sOFowQkxLczlpaEx3TCtNc0ZXSFFYOHYv?=
 =?utf-8?B?dG9zNnFEUTJacWNVV1ppSWFONWZYaEoxWlAzeXBHelZYQ2R2NlhHdUJ0eDRQ?=
 =?utf-8?B?UXgrWnRSbWt1RTRpYWJKYmlCLzBXOGxRakxpeE9ZMlQvUk9VYlhGM3Z3Vnlo?=
 =?utf-8?B?SVJVWGJGaWlpZ1BHUnlQeXkxRmlZanFGcWlxQXVpZk9GQkR2eGV4Q2Zvb1I4?=
 =?utf-8?B?S0Nobk1ZcXFHMFpYSks3WVEybDFCTlNHTXdaRHBOOU11QjJNanMvQXVTczZj?=
 =?utf-8?B?ckIzd0s4UUZyM3ZNSlJrMVcrbmRwenptOTBJQVZHL242dmZUbzlmUGpqWjcr?=
 =?utf-8?B?Q2plZDRtcXQ3a3EwalZOMkJKQ3ljNk1obkVRSlpRbjcrQlZFSFBBc2tlK1Zw?=
 =?utf-8?B?RmFZQVdIcjFmRU0yVk5icVFueWJQMUM0T1hFelpHYjZHSWZ6TXdtbmFvamlU?=
 =?utf-8?B?V3lVLzMzam83Z3F4TTZIMlRiT2FxaUE4WmllZEI5TjRObXlMWm9NQUJaczFw?=
 =?utf-8?B?K095dGlJbEhYRndYMmhQVkhSaE1ZbkE1YjR1MW1xQ25abUcxMENzdkdxT3kz?=
 =?utf-8?B?V0I1UHVGNW1Va21YNlJCWTJocHdRTnBVNDNOaTN6V0Jyck5Bbk14UDR0MDVy?=
 =?utf-8?B?bTRLQ1lMZS9aRWgyVlR6QzBFM0diczdldFozbmNKU3MxL2lxRm5CNG12NlVM?=
 =?utf-8?B?ZDloMTVrdWdQMm9VVFdyNHJ3amlVQTJXZ2dxT0pmRzhIT3I1S0hra2k4QTJa?=
 =?utf-8?B?UjZnZ3JIMS93TUFDZ1VtdUsvcnA1WkxuVkZmZmtYMTVPa093d1QvVGsxRnJh?=
 =?utf-8?B?NGFjczJWZkRBdWJEL3FKRWQ5WUJSd1J1U0lZcVJBcWw3WlZSdGNnSWxMeWVk?=
 =?utf-8?B?WWxYRlRad2VrQXUybVpBUTZEa2V2ak5iVGUzcWNUcUNsckw5Z3VmS0crYy9Q?=
 =?utf-8?B?amlkNW5NUXNBWTk0aWFweFQrdlBLV3N4OUFickZPdGwzTzBxQ2xaa0JocXA0?=
 =?utf-8?B?TFJ1S0t2WlpIaVN2c3o0eWt5cFEwbERTRFVEVkljTG1wSUVtd2MrSmFtNE44?=
 =?utf-8?B?UExXVEo2MlhGaDIzSENRVzh6a283S3NVNkhpbURwVFFzN2UveGVkbGszK3Vz?=
 =?utf-8?B?TXk3aENzZElBWXUyVnR0M3U0aXg5ZXUzak1CdzF4dm0wWW1SQmY5TDdPSUoz?=
 =?utf-8?B?OWhmc2l3TEZseE1JdHdadE04NFVSVmRsOURQZXRDRzExK1ZsVnAvQnBJV3pl?=
 =?utf-8?B?THU2K3IxNFRuSnVHc2RQT2U4alhYQ0gvWXA0eW9sQUNpUkNjVm05WjUvZUZF?=
 =?utf-8?B?Y1RQK3JsSmR3TGF3c3BKcTdKTGdLOWZxWnlPbWVER0pqQ09QMTRlOGpJRHUx?=
 =?utf-8?B?OU1wTldvcUdXY2pyN2ZsK2MwT3QxL0p1Vmt4dGhpcGZoR3FCZ2pEdFBtSkVE?=
 =?utf-8?B?L25IVnlrOWROTHg0ZEk4N1NHUDN4NDZjaGlNbUhueXBYWnNBcDJoZU9RSEh3?=
 =?utf-8?B?eHMwZ1k0TGI4WFdiU2JCT2RYdGkzN3FPb0hrZ2doRlZVL2hFSFQ0Q01vYzM5?=
 =?utf-8?Q?Nmx3jxpEqFIwqAtOg2VKlk8vv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29699CE8D7E88A41BA62F4C38E782269@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JrRu8woGWgAH+OGwmNmnUQ45GJ/6hLIx+j9aiUNrqJoINISCCoJdJsgbaqUF1ArmqDCPUV6Emnrzlt28frPVXfQ0mNIBcTX1IZXoBXwzdgmdixcOb2vI8xWGxITbXpVDJ+zYr91Lf3drfbQb+APZyE0pBrEUHX3QaZEQJnBlg9BneasSr64QxNDIKHMPc6Ar+JFa/x8x6I8fAbsSB9NjvA8lnenfLeuz8gCkOO2Q2qAeySiA+LY9/qA7zrDE5xH9shDR/2N8HgN18t27AOAEBnNRugb4o7w3Rjl97cUTgnHfry0chjCruywGuES2A/TX1eWUcrOqzUreJEf/U0P2P6zrX3el6xIpYkUz/DDMFuztNj1Y+U4b/4bVDhCgbfwMOBqae68YyciMjvENrqieEOHbJMmgDeU1lYGtNmMZXEJIch0MVXOSmZ0EBmgeFq4Y8JbhWlWW/j/SJ5P80M3dZJIbyycLvqVyOJVfagQp/J1U8lPUlChl9ySQ3Z2MLIrI1BlEUvIz1c2Ofoy542/eQLllw+jfNEqWT8FSsMt8BMRPBepa1wUg0Y1nhGw1vrF5UdCpOlWwJfStKHzGC6JJGOATFiZCx07ttXnDgSkFp1q/FKusJh1UoXMEwEafMuz3fdsKVAahealiLxzgZUEjLg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db864e6f-cf2d-4b16-b6f3-08dd51360b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 22:37:51.5081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XK+TK7cdVFaTO1nsVEUBHgZoHbX22rMC/bfxofB8etHmvrScN3YbpOuNo6bC8fCY6KkhX2cuNEpeDyMyobIrrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390
X-Authority-Analysis: v=2.4 cv=S8MjwJsP c=1 sm=1 tr=0 ts=67b65d48 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=qPHU084jO2kA:10 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=8MttnhkfJaIqiuEJASwA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: jRn6mxLrLW9Xm3ynsoL2U5yt8OjxS_k2
X-Proofpoint-GUID: jRn6mxLrLW9Xm3ynsoL2U5yt8OjxS_k2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_10,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190166

T24gU2F0LCBGZWIgMTUsIDIwMjUsIEl2YXlsbyBJdmFub3Ygd3JvdGU6DQo+IEFkZCBFeHlub3My
MjAwIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBhc3NvY2lhdGVkIGRyaXZlciBkYXRhLiBUaGlzIFNv
Qw0KPiByZXF1aXJlcyBhIExpbmsgaW50ZXJmYWNlIEFYSSBjbG9jay4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEl2YXlsbyBJdmFub3YgPGl2by5pdmFub3YuaXZhbm92MUBnbWFpbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jIHwgOSArKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMN
Cj4gaW5kZXggZjVkOTYzZmFlLi5hYTIyMjY1YzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1leHlub3MuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZXh5bm9z
LmMNCj4gQEAgLTE0NSw2ICsxNDUsMTIgQEAgc3RhdGljIHZvaWQgZHdjM19leHlub3NfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcmVndWxhdG9yX2Rpc2FibGUoZXh5
bm9zLT52ZGQxMCk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19leHlu
b3NfZHJpdmVyZGF0YSBleHlub3MyMjAwX2RydmRhdGEgPSB7DQo+ICsJLmNsa19uYW1lcyA9IHsg
ImxpbmtfYWNsayIgfSwNCj4gKwkubnVtX2Nsa3MgPSAxLA0KPiArCS5zdXNwZW5kX2Nsa19pZHgg
PSAtMSwNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19leHlub3NfZHJp
dmVyZGF0YSBleHlub3M1MjUwX2RydmRhdGEgPSB7DQo+ICAJLmNsa19uYW1lcyA9IHsgInVzYmRy
ZDMwIiB9LA0KPiAgCS5udW1fY2xrcyA9IDEsDQo+IEBAIC0xNzcsNiArMTgzLDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkd2MzX2V4eW5vc19kcml2ZXJkYXRhIGdzMTAxX2RydmRhdGEgPSB7DQo+
ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGV4eW5vc19kd2MzX21hdGNo
W10gPSB7DQo+ICAJew0KPiArCQkuY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczIyMDAtZHd1
c2IzIiwNCj4gKwkJLmRhdGEgPSAmZXh5bm9zMjIwMF9kcnZkYXRhLA0KPiArCX0sIHsNCj4gIAkJ
LmNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M1MjUwLWR3dXNiMyIsDQo+ICAJCS5kYXRhID0g
JmV4eW5vczUyNTBfZHJ2ZGF0YSwNCj4gIAl9LCB7DQo+IC0tIA0KPiAyLjQzLjANCj4gDQoNCkFj
a2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5r
cw0KVGhpbmg=
