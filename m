Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626A23C368;
	Wed, 19 Feb 2025 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740004638; cv=fail; b=j+T1Xn/CStbv41/3zqDDYjPpa5SbF1IBMl1Ed60DjoOkHKq4pOfuFmK0zMT0adnqnX+T+6Mwmt+tF1ReWXsub2SovRUZGXSlYB8OlDi+S1XZzur4GwbP8IF561cqvZbPkirX8SDDRe0GHMAQt0nbDH7zsG6KFMye+FyLRmvhWHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740004638; c=relaxed/simple;
	bh=C8eSRkR34dWa99fe8wBdWzZXE4ucZuTHp7C94uoH97Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c0gWwheGUNKpBJqCdX39/ZDdsKS8uKlW5xT9vywpspPDxF4JwPqm+VRwcHIs7hyKWidXRIhiKoYzyDI+XkjcJqIlPQdjsN3J8Pbeop5Wo8fySB6lqBuDGOI+MHZCOGM4yumHSTs/GaELcel8mVX/c7f31W0zdOhRItq+Qe8UQfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PxYmXvYs; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=isya+FEQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qRTrUfl0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PxYmXvYs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="isya+FEQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qRTrUfl0"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JM9BP2009106;
	Wed, 19 Feb 2025 14:37:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=C8eSRkR34dWa99fe8wBdWzZXE4ucZuTHp7C94uoH97Q=; b=
	PxYmXvYsG35uCwDgnZnx5+M4czu1SOMlEf1ipw3X+9X8dW7o4W8FOlmMCSv5rhoa
	1lvk+jrWRcn80PCacKNJrNw9qpBrTl7r4KFt3r22pLqLo7RFoUAg8LwCSjdSJiDe
	HhbbcH79h6R0CDmM6VrzqWz/zSTANnfbsooDZvBtqmwfU2tYjPm7UK6iNmHzRvOt
	UZnd/mmlIOZ1G//RX9mX/frN36fd6YGfcmDhpD3dFuWyL8hw7f2obyHsXDZfVRV0
	AN0nUO2UN7mWNKljBoOSSdResSrC2UWvg9AcOakpfrG+QxEyIPFQGE5I889I9u/Y
	6fe5uBBrPWsYE8PxaSen0g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44w00gr8nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 14:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1740004621; bh=C8eSRkR34dWa99fe8wBdWzZXE4ucZuTHp7C94uoH97Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=isya+FEQMMZ+G2SfvbcMs99NBVqzu91G4eCvrN9VN8vv+W4y8+1QXvdw9LhAs1V4p
	 n4XtYU9aYXJSiSkCom1G1PgTqhSTENa0kaOooxDByRaGDUTQYzy1DPwgq8+N4acAhM
	 fMK6aWTEviRTIdwQU4JxfmrRaLP5iFswwYouyCSPFQJluTr3/tEo0RzvZ3YmHtNFWF
	 NQqckb3en3XtgzWdkRR+7+xRYUJE/w/EkxvimKWZ1DH5UfvB+Y6Pc3eU5rC4kJI33c
	 oSbU+VkLnmQfvw8PDDpbLE53kLHk/W60eUOyYki3WSgurudWjXTOKjRate1g6R/Sko
	 S2w6TFrj9UuWw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9517740105;
	Wed, 19 Feb 2025 22:36:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 31037A007B;
	Wed, 19 Feb 2025 22:36:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qRTrUfl0;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1129A40126;
	Wed, 19 Feb 2025 22:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAbPNmTnultf4dnu0vaIXSwY3Vv79GDXjzkRssBolT0DRGGmKJrTV7fJuaL2+QfQhI11p5TJO0B1DJJr74GcNcKZKvYQ7aqJr3hmNJjuh14ml0DjN4bZyhYXsJ/hmjvVqIEP6xsWguEs1usiDaB5XprcmuUjaMVGAnlWVrg8nbccqTaV9VaakcxoJ9ca3gOTlk2QtRrUp2lmO3KnwNvoSG7HyUnJJAfdg2dbpZoao07auRCDzGL/hOVdNSB3C/4GufeW4dmXn9grMspXCePb4m26e1VOwnbCNupHXcUVyY7908QcMySW2bj5e/peqbxPYYXB9VY16g8EDCJCx70M0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8eSRkR34dWa99fe8wBdWzZXE4ucZuTHp7C94uoH97Q=;
 b=TWxLnS74kNy0kdQHwe+kLy9Ehkb5OM7+YeIoXXGrjRv5+Ec4Vl/TBVEXkssw3Gfwz6vA3hrr1K0bD4hNAOdozV0tG3O7IXG3xZ8NE/HWsjIuz1OO1MlqMpmIxLWMTZfwoBgI26pZd30XgYYyI0L5x6b/TFrpDvRrtOKT1C4IaFPLVR+sDpEB40w8QjyQef3i3F5CwMciRyVVna07EXF8Jeta2OSmyehgzBHQ1voTytSpImr8sORt06SjiBMRqmlAwmFAPEyhqug90ROyd8V8KfE9x1c8rFNhLl8Ese2shKRLHYstjrWBAMHVEAo/wOVVK1W0S8dWxlzMgYWivWQjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8eSRkR34dWa99fe8wBdWzZXE4ucZuTHp7C94uoH97Q=;
 b=qRTrUfl0fa2pZv319nCispr0EAPfzODsZNvDA0APJjZcmAn26jkkoU4ptVUh8Ypjp9U1q/aVJ9NVn9QisPN5vu1HZd8OzE/LeeuNzr+Dsw/gkNVI6DxJ+zi0WVpsZ75udTx7fB5CeL7VmZZzuvcT/JhM2Czf8VxUHWMNjPdenRw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CYYPR12MB8854.namprd12.prod.outlook.com (2603:10b6:930:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 22:35:31 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 22:35:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: exynos: add support for exynos7870
Thread-Topic: [PATCH v2 2/2] usb: dwc3: exynos: add support for exynos7870
Thread-Index: AQHbgjbQH+VlYh8hGUC2JwTiG+RFU7NPOLKA
Date: Wed, 19 Feb 2025 22:35:31 +0000
Message-ID: <20250219223523.4o2h43ptydtpdqjm@synopsys.com>
References: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
 <20250219-exynos7870-usb-v2-2-1de41a89c9d4@disroot.org>
In-Reply-To: <20250219-exynos7870-usb-v2-2-1de41a89c9d4@disroot.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CYYPR12MB8854:EE_
x-ms-office365-filtering-correlation-id: 07752f14-ced3-4896-5d19-08dd5135b7b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dDNpb3loMk5rWGJKSktBRjdDa3k3MUE4SFk1T2h2V1ljcXI1b05PUkQxQTVX?=
 =?utf-8?B?RFI4cjhoazNuakg2ZFV3eVFJNW9LRHg5V0ZCQ1p0eDlGdEVMOUtNbmF5dEli?=
 =?utf-8?B?cHFuZzFoMzA1M0VQQ1B0Q1ZtNHM4TzdlMWYyVnRqTlluL3pDc1hGbXk5Y1Rt?=
 =?utf-8?B?TmlEOVBuS011Y3p2N3E5cE5IQ05lb0FJWkVKSld4ekhMalVXcVZZei9rVGY3?=
 =?utf-8?B?bysyaGxxTzhEZzN5aFlhaFVMN3VQNU0rL09tUjdFTW82UHBWanl0Wm9YVU4z?=
 =?utf-8?B?UzJ3NVd0YmJZU1JvZjhicDl1c0ZYR0NjaGIxQmlzbVpuWDhhb3VneWtTMUs0?=
 =?utf-8?B?emlyN0dZRnphalkySWphOXFxWm15MTI1N09GVHhmZUJ3T0V5bi9ndWNVK1F0?=
 =?utf-8?B?cXplZU9jZkVLWkRTQ2tpVDJKTUhyR2VCd2RsVE90bE0zamxIUGhabDRDbEpj?=
 =?utf-8?B?R3VlaWE1OFFTOVVPUE5XMXpSZ0hDMDlUdkl6K1pTTnU2aWVRU1RkSTFXdzN6?=
 =?utf-8?B?OG9zUXlHaTZseXhscjN0bmtaM0JsNnphU09CbXZEaHZmenJMVWk4b2RVZ2NC?=
 =?utf-8?B?SHhUVTlnaXYwYzdQWGJ3L21YUytTN2ExSHVBaVYzbkFGbk4vRmpDeVp0QXFm?=
 =?utf-8?B?VXUrMDZqN2UwcjZ6RGd5Y2s1VStCQkpTN1lnQlBGZCs5Y04vSDBKMk5XbVpI?=
 =?utf-8?B?V2ordHFkZGJGMUYyU1B2eUVIU3lkL2JvZFQrcWdQeFFEQkxFL3MyM0czaUZz?=
 =?utf-8?B?Y0NuRDV2bTdZRU9OVGFPNFFSN2RKRWxsS3BucnBQOEFpYkc1enhjZFZHck1F?=
 =?utf-8?B?cndWeWZ2Y1BLSXBYMHpLckZTUkZKRVdPclVBcHdia3FpVko4anphVlIza2Vs?=
 =?utf-8?B?NndIcEZqM2sxaHIvb242SE5odGFVN213TnNwNmV5MjNlWFZBZk12eWdYTVNp?=
 =?utf-8?B?a1RBc0lScGpsUWVXVXpWSnVjZ1M2THVXbjFyUUdnT2RkM0ZTK2kxSXJQaVlz?=
 =?utf-8?B?SytCT0pzK1J4TTdDWVpnK2JEUlZNcGhZbWVGTnMzeFFRMGpsb2pHTnN4dVN6?=
 =?utf-8?B?RXdDc1VsUFdIcWxvKzl1OUZ4NEZXRXhQOHkxYXBJSVdmTG95SnBMQy9xcWZm?=
 =?utf-8?B?c2lMUmV5Uk5kMVE3anh1MUFJYmZIK1dqRmhJMkU3S2JBdEJ3ZFZJZE1iNDFk?=
 =?utf-8?B?V3JKajVjRTc0NVJLQUJvZlUweUp4MXZmTXlHT1JCUTZUbU1tbVIvWkYybGIv?=
 =?utf-8?B?dm1KcHZSL0puNGJjUDJGYWJwMXNTM01vVFBweThWWXhlMUNWcS8vZHUrQ1Ja?=
 =?utf-8?B?LytPNHR4MFBZQ2EyZElWV0EwK0VBZVNpbWpQZEtwMUVJNUhkUE9ZTThSak0y?=
 =?utf-8?B?cXI0UFh3WVlUdkp4dTQ0R0JCcVAwQklGcnN0cm45RU5KdE5nakYveVQxTDFV?=
 =?utf-8?B?R2lkZDh0N0k5MWNZYU9CZWNlVTIwNDc2MUd2ajJUdUsvSUJvYWM0UmMzMDZ6?=
 =?utf-8?B?Y3liMmJKRXN4cTJKOEE1L1Q5THpTQ2dsRE4valBiV1ZCbjhZUFVIV3NPbVB4?=
 =?utf-8?B?YTFoNnhGbFp5M0lqSVJLVDNnSUVvTHdsdEUxZ3d2U3NaaWppeG5VRTMzbXhR?=
 =?utf-8?B?eE5Eald0YVVZczJqYWZ5MGVYSlFDOVJWbEpjZ1pSNklTRjFBYUVpYWF4Rmpn?=
 =?utf-8?B?LzlmNEhlWXRJVGhJaUo5NDRxcmk0aFB3QjZrcWJqY3VQN3dUaHVBM2duNTZ0?=
 =?utf-8?B?RVY3UHRXSkR4ejVpS2hsOEFlVVJnR29wN04xRHVRLzU2THlaT1dZK2J5Rzlp?=
 =?utf-8?B?dkM1aVpRNHdVRTBCYlpyQk0vQnlCblhxZGZmL3ZxcHowcjhja2lBV1IrSzZt?=
 =?utf-8?B?emtkOTZPWDNHc3ZrcTRqZ0FjRVJtRTJpa0NKaytNTDZ3Q3JCMkhBSW1paUdx?=
 =?utf-8?Q?GIDBCYIcIGXVW2/M9o7KAeRwPdu20Lrg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K05TeHJvbWRmV1N3aHhSZmo3THFQR05GS2hXSFVPUHdaanAvcGQ5MysrR0Z1?=
 =?utf-8?B?OGF4NFcyeFYxdXdSOG15TWpjY1R5amVNdEFJeUJQVVl1Vys1Ulh1YTB6ODFz?=
 =?utf-8?B?RkxrY01HdUZlTys3WlJRTzEwZkplY2g4bUJoQUJXZEdTMmdlY0haaHAzYWNY?=
 =?utf-8?B?Tm5qVkUxMzViazZ5OGJnS1Rkd0JRODg5YUdNczkzSU4xeVJYdEpBNE5ka3pV?=
 =?utf-8?B?bnVxY2JFV3Z1aHBhMUM5ZTQrVU9TaE5meEt2MDE5OW5Zcm5WWVMwVld4ZTdv?=
 =?utf-8?B?K2FHQmpPTHl3SFZ3TXV3anQzS1ZMblI4c29uMXNTNlJLaVVzcTNyMGlCc1o4?=
 =?utf-8?B?TlF1Y3JhUHliTkh1YUFza1RUSjd6d3hhbGxsOXhaQjdFVzk1VEsxU3V5allp?=
 =?utf-8?B?WDk0bTdHNkhITklQOGg4cENUaFdTckZWZldnbDVQdVY4K1NyZE5YbDlQc3pa?=
 =?utf-8?B?a2drNWhwSXlJcWN4SFJ4S3d2bE9wVWxSbW44eWJPblVIYklWRmRMZG1na2pP?=
 =?utf-8?B?ZGc5K1lXZmlKM2ViaHErSVBVQmtEcmNtQ3BOOEI2cEY2OXZqaUFMMGpiblJQ?=
 =?utf-8?B?T0h6OXM4cU9jQ1lmRnUwWTdHTzZxQ0FXamt2ajRmK01oYTFHeG0xSUxmc2Fw?=
 =?utf-8?B?RTFSdEhkWXZ4QUJvSkpTV0VZRU0xUjJHbytwQlkzVlRlVndFa3RQRThLTGkr?=
 =?utf-8?B?T1BiSjE3SHZJc0d6WERhaklKOExDT254ZmpneWZ4eEU5UWhJMHBnVE5pMHN3?=
 =?utf-8?B?NjE0bWhYb3piZ3o1RTBDSjFpVWxzb1dxZGhtNVh2K0pWT3haalpDV0VnME1D?=
 =?utf-8?B?Y3hHN3FYTkNzcGp3ZzBBdzZGWDVOZ1N3dldFL3d3SzdlRjg1TCtSWUR1UXBE?=
 =?utf-8?B?eE9QTHh4TGxZamN4c2ZTS3FDVG80SGN5RENWVHM3TlQ1ejNrTzhkaGtGN0lj?=
 =?utf-8?B?cXZUa1lYbWFSUTN1OVdoNkRuZi9vaVY4NHNlOXJVZWZUMTlubzVvOXh1NWtR?=
 =?utf-8?B?cVFRMEw1TVQ4VzFiY1JkL25zWlZnbDJOcDVqSzhSWjhUY1oyV3FQWEJFaVI3?=
 =?utf-8?B?ZWZZWEZQck82ditBZkhGVnh2QzErNUJCS3dacTcyT2hqQksrL1lrU3ExVVZI?=
 =?utf-8?B?Y0lWdlRZZElVUnBVWFlXS1ZGWDh1ZTZGTVJ2VityR3NyS2ZZMEw5UVlRTkd3?=
 =?utf-8?B?RzdwSDBWSFo0U0VrRUdQaTNFQ2FxK2ovSDlNMEFWc3JPYUxPaytlSnRvb2RR?=
 =?utf-8?B?bnlReDFPdTZNcUtMMUh0ZkV4QlRIK0xhVm9GM3hwc3VYL3NJUlBER3l0dkRo?=
 =?utf-8?B?Smxjb1lHdjR0ellzc2FQTG52U29rWHhDZWJHa3E2SWJwMjh2VUVyMUFEMHVp?=
 =?utf-8?B?dVA4bWZ0Wlp5eDRjMFVobHBSOFBWbjZ1bDAwS056QzdadTFvdForRFp2cXJL?=
 =?utf-8?B?QStJRk82YityRy9oQTFJeXcwNUllNmtpdkpUamdlb0p6OHpxb0pyM3FJRVow?=
 =?utf-8?B?a0VUSGpVV2M5TUtYU2d5TXhWN0F4NytjUmp2a2xDY21GRlpiQ1B0NkdORUxO?=
 =?utf-8?B?U056dXpaZHFORXhXMXRiVEhjSm9RUVpYOVY0NVJyNGV4ZjJqV3RGV1k5VDJn?=
 =?utf-8?B?dWhqNHVVL3ZYelFHcWdpc2d0Rk41U2tTby9QakxaN2FHTmFOQ1liK1NJMVFF?=
 =?utf-8?B?V3VEbFZ5d3czbFcxakxrNG9hdlFVRnlRWUZQNnZocW1zZVY2UllMSTBSS3gy?=
 =?utf-8?B?bTVuamljdUFoeDA4QjYzcmViN1ZPRWJzQUpGTU45K3orSzFmRU54MmIwMStE?=
 =?utf-8?B?RWMyelJ5c1YzVGdaWUVsM2xGZld6Y0tuSUdUb01FUHNqZUpVNHNaUVVPNUcv?=
 =?utf-8?B?aElaejliTU5XdE9kL0t5NXVSbGFRazVLbEZYZ3NWRzI4K2FvZ2hsRFVQSW1P?=
 =?utf-8?B?RXAwUUtHUUxtVjM0cGpXdW1Namx6d055R2R5MUowdXlCN1FyUzhtendnRENE?=
 =?utf-8?B?dE1jVXFxZG9WUG02RTNMVDlodndjZUh5Tm1sVHZuV2RrdU56U2RGclFiRCtU?=
 =?utf-8?B?VmdHQmhRNXJWMUNZOHN2R3Q4SUhxb085dkkrUC9aZFFWL3JNUnFGeXJuVjlJ?=
 =?utf-8?Q?rVp7fY+qhmz98IssZmR4cIs64?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <907CF430CAF1AE4986F6085996B61A4C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TTglR0V1y1yv5gToEGZWqRNAU1NlHUsSIZbk3UW0w1o2DpwfR+lWoKGU1J7PAJVvI+RisSW8dg3D7+Up4rvm/h9kkxTBg8COHX8VtP0uwbDltx1Q6CU+vPoGt9jAveAhphSWsxQBfyBgLX6xX050cQsc2lPU3WCL9zu46LJ1Vnb5ivBIOBI+Eu9EJMJt2wwlwC0/jQXB7npbGVgfmDhsF3QvaIckR4ipW5JJ7HVhQKxOk61vldUcjBYIgNwr6UvxDJUyKcDBp2MU/FApuMbjlmKHbj/Q73clKJ1J43FroLFC5Y/0dmx2/QPwZL4Q15RsNP860g3xOvfSUkMba+z9oIfeRsmqGCZKvpn1/kZh/ZkLFxjR85yDoEd7OI5FIIIGnrxsgdsIDmkVU7dVMtbyCgfpnM+6xv/Ci7Ear51Wij1Uexti76c0R3FvqfBK9sM9GSMLxA+kAA1m5e6EzYPuIG6njfG4O/+2wE2AfmDWNbJhSz0lAerG2yKYoiAazTe1c79rs3VzDW6V2JuI3517e/dv9HrwyQOFGbPdyuJT97Lv/xdL2Aus4H7ucQUp5E/80A0RQDBCIQSP9UYfYXc5W7Zsz8U8q0iml6dm9O2TlVp/4NC7hD/WHN7kVpmihFeq5nkZU4AQwE55NketCaTT1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07752f14-ced3-4896-5d19-08dd5135b7b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 22:35:31.3433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mEupj36tV2RxA34FNs11FZvI883M300RljB2JdMtgVh9sgWvwkC8qIfFDJsJkWl7oHKCXer8li2gZPKrlnENzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8854
X-Authority-Analysis: v=2.4 cv=XehzzJ55 c=1 sm=1 tr=0 ts=67b65d0e cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=qPHU084jO2kA:10 a=LpNgXrTXAAAA:8 a=jIQo8A4GAAAA:8 a=YyVnGF7b5AQwg-RGk8oA:9 a=QEXdDO2ut3YA:10 a=LqOpv0_-CX5VL_7kjZO3:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: re66iFTX6G1tO0Heri_sUcNI7Q1n0vXK
X-Proofpoint-ORIG-GUID: re66iFTX6G1tO0Heri_sUcNI7Q1n0vXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_10,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 mlxlogscore=879 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190166

T24gV2VkLCBGZWIgMTksIDIwMjUsIEthdXN0YWJoIENoYWtyYWJvcnR5IHdyb3RlOg0KPiBFeHlu
b3M3ODcwIGRldmljZXMgaGF2ZSBhIERXQzMgY29tcGF0aWJsZSBVU0IgMi4wIGNvbnRyb2xsZXIu
DQo+IEFkZCBzdXBwb3J0IGluIHRoZSBkcml2ZXIgYnk6DQo+ICAtIEFkZGluZyBpdHMgb3duIGNv
bXBhdGlibGUgc3RyaW5nLCAic2Ftc3VuZyxleHlub3M3ODcwLWR3dXNiMyIuDQo+ICAtIEFkZGlu
ZyB0aHJlZSBVU0JEUkQgY2xvY2tzIG5hbWVkICJidXNfZWFybHkiLCAiY3RybCIsIGFuZCAicmVm
IiwgdG8NCj4gICAgYmUgY29udHJvbGxlZCBieSB0aGUgZHJpdmVyLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogS2F1c3RhYmggQ2hha3JhYm9ydHkgPGthdXNjaGx1c3NAZGlzcm9vdC5vcmc+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jIHwgOSArKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMN
Cj4gaW5kZXggZjVkOTYzZmFlOWUwNjllMWJkMTQ1ZmY1YmQxYjcwNGRhODlmYjc0Yy4uY2E4ZDI5
NTUzMDNjNTg5ZWEwM2EyNjE5NDRhYWRiNjU4MmM5Y2I5ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1l
eHlub3MuYw0KPiBAQCAtMTYzLDYgKzE2MywxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNf
ZXh5bm9zX2RyaXZlcmRhdGEgZXh5bm9zN19kcnZkYXRhID0gew0KPiAgCS5zdXNwZW5kX2Nsa19p
ZHggPSAxLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX2V4eW5vc19k
cml2ZXJkYXRhIGV4eW5vczc4NzBfZHJ2ZGF0YSA9IHsNCj4gKwkuY2xrX25hbWVzID0geyAiYnVz
X2Vhcmx5IiwgImN0cmwiLCAicmVmIiB9LA0KPiArCS5udW1fY2xrcyA9IDMsDQo+ICsJLnN1c3Bl
bmRfY2xrX2lkeCA9IC0xLA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd2Mz
X2V4eW5vc19kcml2ZXJkYXRhIGV4eW5vczg1MF9kcnZkYXRhID0gew0KPiAgCS5jbGtfbmFtZXMg
PSB7ICJidXNfZWFybHkiLCAicmVmIiB9LA0KPiAgCS5udW1fY2xrcyA9IDIsDQo+IEBAIC0xODUs
NiArMTkxLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZXh5bm9zX2R3YzNf
bWF0Y2hbXSA9IHsNCj4gIAl9LCB7DQo+ICAJCS5jb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9z
Ny1kd3VzYjMiLA0KPiAgCQkuZGF0YSA9ICZleHlub3M3X2RydmRhdGEsDQo+ICsJfSwgew0KPiAr
CQkuY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczc4NzAtZHd1c2IzIiwNCj4gKwkJLmRhdGEg
PSAmZXh5bm9zNzg3MF9kcnZkYXRhLA0KPiAgCX0sIHsNCj4gIAkJLmNvbXBhdGlibGUgPSAic2Ft
c3VuZyxleHlub3M4NTAtZHd1c2IzIiwNCj4gIAkJLmRhdGEgPSAmZXh5bm9zODUwX2RydmRhdGEs
DQo+IA0KPiAtLSANCj4gMi40OC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
