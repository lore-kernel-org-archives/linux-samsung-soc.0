Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4D1F2B90;
	Wed, 14 May 2025 22:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262971; cv=fail; b=hL/1F3gG6CdESiaqpQol52UhRexo4/9TTZWgscRaQERpGWTpPsvAzbqWJQgWAiPNEjDFlmg143kmCcer0CFiUo6okxZs7/uP6OKf1Bohdv9y+rW03lldHXmL1JZi5Ub9zQEjbj0aeMJ03DgTaipOYaTPt6KlHA3o3gPnXHFEBho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262971; c=relaxed/simple;
	bh=Is3oX6fhbeX6m9N2nxokXolleOhVhB606I8bcHLBJs0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F6gP2LmCGze4NW8hURAk6YmZnQV0g4kfaUO6jQiEBIqRpAblKeInTQ3ytvenaWdvVCCscVLNhUPcZ9StfVJgoXX7kuEA1IuINeObwmKl7/HdDPcKSD7wKoF4jqG6zpTn6hVW+UI4Gr9xF4fNsQX30yYHI4HdkPJj50fM5tlySfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mDCYZ7fx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AFqLJ/cR; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=o2I1kh6U reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mDCYZ7fx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AFqLJ/cR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="o2I1kh6U"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EHC2FB008122;
	Wed, 14 May 2025 15:49:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Is3oX6fhbeX6m9N2nxokXolleOhVhB606I8bcHLBJs0=; b=
	mDCYZ7fxJlg0gdyut4b0wb0aJzSGrPQKgdDa8Vps8njqC5YPh4l8Zz/mPJF30XI1
	UwHki+3ZA8QJCJuueP6NQf6adW3aBdYVvT+/eF+Wdr3Jz/ZgWSl9Ti7B0QuFdbAs
	dfuEPNNXRfSVoFRqYoQTDQsC+ib1NKT67O+Mr5ViXf99Xtf3VqChHhcW76UCuigI
	PJa8devlvB+tMTB+opoVHjC0FS/xn1Qyv4Mcf1KeKPXlWny4Fb/hG8BPyEJz06hG
	wNjWvlpk2Y9ejFXrg3/kvW3u9NMUOhfQC0KOADXMkfaihe15BqKyRYdM03zA6Q0W
	fHua9ADQj8dkYSBCgawDSA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46mbe4gvyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 15:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747262948; bh=Is3oX6fhbeX6m9N2nxokXolleOhVhB606I8bcHLBJs0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AFqLJ/cRSlHIp2BlLOJnHvofxb7hdbOG2G0A8QgUi5YO9XcfgKnlBFgmZ/BsHKkNT
	 1rNWP9UyGRxykTptWffuXc22SOAy4DrqPDzePdm7uQO0XQbjrvvEA47ougRaemxX9b
	 vJWE2YliwfDUvqoCJEtCq2COmX+9Nez3jQdIORackbl7kPEZ4380M/scjacx+OjfXQ
	 xO7298azDH1W2wNPdvpFVr55A50baZqCPDdEB28ZdH14/cgtCmSGDbA5IFgsbtKym2
	 3INAjbtJy0EthU7ifso1xZx95ci0IxXAHVfSPz3plDEXBcnuwxziR50WRGQ1y8ZWbK
	 XGV24zJWAkx3g==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 562754013E;
	Wed, 14 May 2025 22:49:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F2206A00AE;
	Wed, 14 May 2025 22:49:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=o2I1kh6U;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 449404056C;
	Wed, 14 May 2025 22:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiHpsGrcHMiei5FTwlBiU2yGQF5mpoAoRcK2pEhkUuCm3hIOMZi7B1vUPlo62TJ06htWE7oNyohFfZCG4qjHehYClqY5372FJAQphfk0GSYtkfyyfVFNZaHEczU0G/vxpB+0XIdZ5pLmTfY9TL7gjwrwx/5fjZT9gXe8sqbIpLe9r/SvOyVAqwDPGU7Ancx70+Rvwvhu9UZy2/qGPKIedlHUQRkxGfy0rMBawMRrnC165sTGdGAkZoib3usFqjJnKklLYc90UCADfiwEl65GGkgk3ghIly1IxRvtrUs18VUlWN7RbVkvfAc4BZtZh+Pcq5paSx335T7QjtkKuLuTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is3oX6fhbeX6m9N2nxokXolleOhVhB606I8bcHLBJs0=;
 b=wn9D1K5MM5ssE0VXnowMtw70V9pDXc6SSTMMAJMKi7Cul+0GciwdHYEDV3rJrT2GMLhnIRxaWEguk/8io5ILefbJuxA1vKCsPkrU5/25DoogchN0nkN/D1RIz9dG3Kh57KDjeyjGTWFoMHRJzY+vbfCRUwylO1hRuLPqzKaOYicFegvoUOYdttq8Ry8coYXsr/qXWkY41Luk1irsgpp0o2ANUxCme/PUG8DRxg8R28pOZoc/BwK0aYk7Dpi8TCkhpSHP9SZpQpM1DWMEgYDVHHCVFfuThh+dLJtuI+ln+iqYDbMcU6utAV45hbTjEqcwNzlLBFORaOvN2XbF2jJW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is3oX6fhbeX6m9N2nxokXolleOhVhB606I8bcHLBJs0=;
 b=o2I1kh6UUuMrOloj1vdOsbWvRwX6X0GtWZAHDciuBcShRDxoXSNE3B/iiNtUsseRISUXxzR9NTTfjaG8eiJb9aZ42nc2wr02DNm0HCzA8XpH7+obM23dksj9KavNl9MKwp2368PDYVnsWPsaWo0yqIn3zl6itoOAbiAKsepSIU4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 22:48:59 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:48:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rosa.pila@samsung.com" <rosa.pila@samsung.com>,
        "dev.tailor@samsung.com" <dev.tailor@samsung.com>,
        "faraz.ata@samsung.com" <faraz.ata@samsung.com>,
        "muhammed.ali@samsung.com" <muhammed.ali@samsung.com>,
        "selvarasu.g@samsung.com" <selvarasu.g@samsung.com>
Subject: Re: [PATCH 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Thread-Topic: [PATCH 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Thread-Index: AQHbxOqxrNTntrDxGkWFZWkw3XghNLPSuuaA
Date: Wed, 14 May 2025 22:48:59 +0000
Message-ID: <20250514224853.6eivsv5iwekrkeoa@synopsys.com>
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
 <CGME20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9@epcas5p1.samsung.com>
 <20250514140741.415981-3-pritam.sutar@samsung.com>
In-Reply-To: <20250514140741.415981-3-pritam.sutar@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB8108:EE_
x-ms-office365-filtering-correlation-id: 2bc2c383-78cf-4622-1354-08dd9339842e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXlib3UzcFEvQ3cxa1FGYlBvQ2M0R2xhVDFrZlB4N2RvS1l0Nk5lUEE0WklD?=
 =?utf-8?B?S25ySFA0UCtRSHBoeXBWL2JnZ2lDRXIxODB0cG8yUjRrUThHMFNWR2UvbXZs?=
 =?utf-8?B?eFhJcVRQbENmNWo4L0c4WVNuWXBBZmNYR3FIbnQ4ZkQ5cFVKNkhIOG1zNEps?=
 =?utf-8?B?S3ozbUpHVVpsSU5VbldET2hGZURWOWpXK1lpcTVGdVFCVVlLME1XZG11OS9o?=
 =?utf-8?B?UjNSOHR0ODRSWW40RnRqUE9uUW4rWm1xNkNVRUtrSnE0d0ZwaHN6ZENJbnRr?=
 =?utf-8?B?aFhLa0VvTjFVOEoxWHlqbzUrMUNwRXB0dDM1T1g1UHRJOWorMDFxbUN6R2lD?=
 =?utf-8?B?NUQvTmFOVWQ2U2VlWExDUmZkcEJWZWVsd3lOWloveVpYM3dyb2Q4M1ZvNXBF?=
 =?utf-8?B?YklPaUJxL1poNW1RQkFwc0xpSzUrck5tM1lvWGpVZ3NYL2lEZHl3bVRROWhs?=
 =?utf-8?B?NkZXUXIyZVdnR01aMkwxSmN6bHVYamY5VlB2QzJUZnpwb1RjWENyVHp6YUgw?=
 =?utf-8?B?K1YyT2d0a01GOWhZRkxWNlh1RGhiRDVhY3EwU0RiVlRBV21CbkdKT0d0SHd2?=
 =?utf-8?B?VWxHV0liQUJIS3ZkaHpYV0hIYVZwOEpVczc5clRZQ3QydFI3OEM2NGZWcGk5?=
 =?utf-8?B?MkVjMmd1NFJZVWJtNkwrRU1hREhtbFNDeHA1V3VERC80S2VycFNwRUhTRGx0?=
 =?utf-8?B?Vm5BR2ptS1NXYjNxNEgyT3gwaVdPQ1l2bXVIL3pzdGtEQmp3YzMrSmxWZFdS?=
 =?utf-8?B?UmQvRFJ4cnZlMy95NmdaTWxTZGtaMUhkQkVDOTdHaFVDVC8wd254enYvaFF1?=
 =?utf-8?B?TUFCVkZwREVyNDgwQ3lSMEJrRGlCakh5VVRWb3p1Vjd1TkJLS0RkWlBVMmhX?=
 =?utf-8?B?N3M1L2JMRThHaXFtUjhyMHlDeHNDbDNkd2hzV3ZkaExpaEJRR2tFdGdUR2N2?=
 =?utf-8?B?NHlvdVFQelIwd2NvTDRvK0NyU2drRXFWOHdvZm0xcmQxRWhFTFVrUTRGa3Bn?=
 =?utf-8?B?b0s4ZVJlV0c5ZFR0S01TMzd6NEt6MlZTdGVTRkdaeGFKUVgzaWorR09SaWtV?=
 =?utf-8?B?WlFQYnQ1dUpkZll1T0pCeWt5OTRiMXJZN1pvTEg2emNIVXdKSHh0bzRrTzY5?=
 =?utf-8?B?STdNV0ZkZGtpOFhoNm5EcU4zcjZDR2N0Q2JQeGJjU3pjK0E4QUtkYmtXTG5p?=
 =?utf-8?B?WnduMnBKYVBTSEZkTElqOHlXdys3RnRNSXd5OEtZUHhteTFjYlFmcjFtdFFx?=
 =?utf-8?B?bHVtakIwZWFZMWcvUlBlOXNBcXZJbS80aUtROUxSU0pjM3BXWmlraVlEcEZs?=
 =?utf-8?B?aVRCMk9RYlpuZXRIVVdvdkFxTmd4S25WMDVaU0hOR1FqU3JsL0FOakxvTzhT?=
 =?utf-8?B?UTBuNkxwdWtTSFNNbXI1ZFNtd0xkeEFSazgzTytRU2NVQzlOanhIUmQvSUdw?=
 =?utf-8?B?Q1Rra0h2MWVOVVJlWE9wdUJlMmFvbVVkSTBoWTFRTE1TSnR0QXYrVmZYN2ZK?=
 =?utf-8?B?SWRxdkNFUUNNQkhYVUZKaCsyeEJzSmg2QkpiQVorODlmcnk1STRoWUxRTnZm?=
 =?utf-8?B?U2V5UU9PN1EvQlY1MUVOOXdyL2o5YnBpSkZ4d1doNVNBbnkwdGxVNXN0R2VX?=
 =?utf-8?B?NTlIaHJBTEd1elQ3aVBYZDF4YTlldzJRK3hZNVFNZytDTGt0VDlvMDdlbWNM?=
 =?utf-8?B?RVNiODVWbWViWVI4V053cnBqUGp6S3Rxcmh5OWZxMDd4UkFYNzBBdXhNVFo2?=
 =?utf-8?B?RGJNVHBPZWdSWWpPY3lCMEpiTlV3eTlXdVE0R2IzM3RQOHdQcmtNQWszaW1v?=
 =?utf-8?B?NG1XY3hHZndMcklUU3l4MUZiemRYU1p6Mzd0aHd6ZGh1WmwzeUkwaVJCYTBk?=
 =?utf-8?B?Q2t3aDZVMVRjT1daK3Nmd2JEUmtKdVVvVVZXR2thL000b2VUS21TVk15RnBE?=
 =?utf-8?B?ZjNHL1dVcXpZTUVrRFlOeDFQd1BUVE9adVZ1dCtEbFBkL3JxckM3ZXFHVTg4?=
 =?utf-8?B?NVdDcTV2UWN3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MW92Ky9naUs5bmEzZTM5SjEyQmRHOTB1VmRvVzhwYm9qRHRJNU1Cck1ONDZK?=
 =?utf-8?B?MlJ3cDg1M09DaE82THVUbWNQWFRQenFDbTEzcVJDVE1QLzU5TTZTd09nODg5?=
 =?utf-8?B?SEJ2Y2lzWTNRRjBkQ0VjNjRHMGpLNjBJdGJkQk1hU3hua0g2V3EvcTRLVWFN?=
 =?utf-8?B?RFhnajlBaTg1eFdkaUxLN3EyL2krK3I0ckZFNGl6UmU2NWhqWGVQcTgwcnlP?=
 =?utf-8?B?ZDZHdUFGbEN6V3pzUm92dFJ0MmhqNFZCUit0QWVjWmJBZGdOaDBUR2dwRENn?=
 =?utf-8?B?di9jOGlWMnRyNjlhZjA4RFAvd1pqQjhBdTQrd0JZV1JaQkNIa1h1eDZoUVdZ?=
 =?utf-8?B?cHQ1NmlpUjR5MmwrNFR3WnFITzBGZnpyUmtBbkRvQ0xpdWMvYW9FNVFuRm1K?=
 =?utf-8?B?SmpXa0ViUnVtZ0dodVRMRHYzME8xMnJtSndacVVoZFRHNVNOMTRBRTBRalkz?=
 =?utf-8?B?d1UrK1lnOGZuZU85c3QxWHVNa21DblZRbjZwcURxSTQxaFoyV3lOTjFJcEJt?=
 =?utf-8?B?M0Vad2hhRHVCT2NmNis1WmJOMk54ZzBTUGtsL0d2Ky8xZ1FMYTNiZUxwTVln?=
 =?utf-8?B?V0w3ajVhbHFuNmpwRUd2WUtqSGc1OVg0dWxId21IYnFoeE8yUzEvOE5VTnN6?=
 =?utf-8?B?YWRoUDl1S09QeVZCbHBZTzdVTmUrK2F1QTdxRjl1Ym1ycDNHaDBBUEFpa1RM?=
 =?utf-8?B?RGEzSzBERElLNk1wWjFLeVVZUklvQXFzNXNiYUhyU1c0N2Z4RE1KWUI0Ky90?=
 =?utf-8?B?cytWc1p6NlFNczNhcEQ1SUlrM0ozVisrS04vVi8vYWphN1lHNEZNbW1RaUlX?=
 =?utf-8?B?Q0JKSzFLSEM0L01hZDZoelNoMTVrR2dsY1l4WGJmcmpBUUdkM3BYTnZEWDEv?=
 =?utf-8?B?bm0yRDF0ZmM2RlZlLytnQ0ZRb0wya0xGRWxOT3dHK21HdUlKUi9LWEpaKzg5?=
 =?utf-8?B?OGRTZUZPSlBjbUhnYnNMV2NCRCtKd3d6LzFtMWpwZDUwZGhlMFVJN1RKeHgr?=
 =?utf-8?B?N0x3ZnZ4bmQzNnlWUVNuR0Q3RXZBTWxITUV0SFBZRlh1RWNXZzdNMFlMb2xw?=
 =?utf-8?B?SWMwY1BIc1lINStTQ2hoczBlUm5jWmpkQk54aHUza3pzWDdXRmtvQzhnM3Ax?=
 =?utf-8?B?SS9XK2dLVWx6dDdSVDRTL0UwUmFNRWZpNGtwN2t2Mllzc2twdDdKY3YxbDIv?=
 =?utf-8?B?Q1BYZm5qUmowQXRvRGNqQmFycEZGZ2FJbmpqdnkvYll2WFgrTjJQK2JNbjFo?=
 =?utf-8?B?M0h2WVgvSUE2TGVTNkZ6KzA1M0l1RG9IcGgzZkIwUlB5RXFZM25iR3JBeFJD?=
 =?utf-8?B?OE13S1FENGszQkhWKzVnSXB4YU9jaWU1U3ZSSHExdGxUZ0FRc0NjaGdYSDBZ?=
 =?utf-8?B?ZGpjellNYU14ZExLRVpiRFVCblhMdGtTWVV4MUt5dGxQRU5vUVpRU3Y2V2FT?=
 =?utf-8?B?QVR1cFVvL3RoQkZxVUJ4bDQ5SERkczY1NWt5bm1mWi9abnVJRjVXejhIWHNM?=
 =?utf-8?B?OGpUaXdjaHFMc2lvdm9tendMcUh4UU9uMW52bkRwdEFZWFBuWWtOR3YvR1Jh?=
 =?utf-8?B?OSs4bzFyYlNxL2RsNDJBemlhRW94YnI4T1Y1d2ZTUGtET0VzdXNtMGpUaXlO?=
 =?utf-8?B?c0tsZHQ3UlFETkxpMEVEUGNmdXRLZlBDTkUybnVuYWUwYWhSaDAvWnJ2d0RE?=
 =?utf-8?B?SjRmTnhyejhaRUEyMGtkYTZ0Sko3Vnp2UXNrWDV3dVp1Z2lueVNEVk85VVFq?=
 =?utf-8?B?SHRuR2NXTE5yYVhaUUt3NUQ1aUZ0MWtUWlNJclpicERhYTM5bWpIVHQ4bjM4?=
 =?utf-8?B?am02NE9UZlNpandzK0pwMzBTaWpmNHgvbXE4Y2I1TUtxMEQ1UVV6bkdIRElD?=
 =?utf-8?B?MDRLN1NyK0N5OCtuZXE1SmcxdzVxeWpDL01rYWdWZ1d1MGZlNm14TXZOUXVT?=
 =?utf-8?B?UDlqTFlKQTBLTEJCbVZ3ZU91MDZWWjN1anNIanV2UlBDR0hZMzBNNXhmbkU5?=
 =?utf-8?B?N3FnOFhUWWtXeFJZUXhmQ3BPVm1ISld3d2xPOEZxSTBVVDh3UjE5Unk5Tm1o?=
 =?utf-8?B?OVRBYlhQTFA3OWVoTjRaSmpNQWFXM2doSTRsalVOcmJpYndoYk1ycFUxV3Vv?=
 =?utf-8?Q?xmh8Fh6rnC91dZQ3cwIvN7FaV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F32F2C5D512EC42A12462A8CC372022@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1kusWTj9UBZ5dIAIVxMEE+hcxMcrXCFp4F5DrWgauM5CRum67VBLKM3e4biPuyzv9qppdkYrz0WFyhGqZSPRf9CngYakHGzGlPsX6JYUTtqhAGi0BwrTkfWDcj+sb7vkw7e3eUB6FBdbhLguuFFTvPtiHOpPqxiDcN9aWbVzLhJ3m8wuOyxUk8rUlJlt9xHvjmvEkSicrThDKlvPeMfmPhcIDoM1ObzpvbjAe1LR1AwfvWrZGtS2uox7Nnc1ZdLb8SiGoSg1VfoP3kZEZ+i86QzSoTQ0EpeboGVBNzGzUuljXsGvqQhuRj/syQXeWECGYMwzyN/JFw2O9AtjOrFUTAFoz3JX4k8BuxzsLuX6OXIoseHW08KBsi/5NMGm/VJ41hTJBrv34cpvBgNZVxNLuLmgN4RubUDWSzZvJplufaL4fLQhz7rJ1UJe8Jfcrn+JZmaUcRlpbDGoNL8ategXarkDRUcVlX7y2JfGV8TuWUye5SJjGl5q4eiFyGJiIUfHuwmcYjtBvq168WSagNhO2tdZwnWvdMBc5ANKmSeXthsCFb79MahxLqX3WNljr+gpG49TTE22fQEreidPDk1SQBhIDvWM43JdIRWwl4HI7JcgWWxpeleHmM4m8djMJGzNVXkpcrOwQGqryWxREhAiFQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc2c383-78cf-4622-1354-08dd9339842e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 22:48:59.6002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2Vu+wNM/Fj4+MNR+9ACPlCu4Ui50aeAbVlw2zO5NfEHACsPa6hmS10atDJ9B7SdDg0ya+MM0bTWYZ6ymNcgUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
X-Authority-Analysis: v=2.4 cv=C+XpyRP+ c=1 sm=1 tr=0 ts=68251de4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8
 a=-THuiK8_ek_movOPcLUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9xFAPAUvNswxsewY6Daqg8pVsGvfOUBg
X-Proofpoint-GUID: 9xFAPAUvNswxsewY6Daqg8pVsGvfOUBg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIxMCBTYWx0ZWRfX1FCukxN143Bw
 hyrcYYznOzdn2Zarat54cgt/qR9UfHFqqcJYJv6CggmIYMRKpdL7iReTwm3dgbfil6EZhVfD5ZP
 PEDqyfDjbp0Kt0g2vWF2VXbCpyE+9iJkbYeg+ptTbzq3w9tLuGir8Swmh5Y+bp2OkK9/RKCz1h+
 RdPMuaiyJEfQkoduHUAwWE7tidczDlDNahtSndkdEFNxmCjCqmKjx281sxd6LtcYK6bo2jVu+nJ
 q56WmTi9QVkbjfiXzVY781va7ALA2FfGnc+8Q9sO92OPOI9PZheayIdhRHRboGoAkgSXxJcXJe5
 PUjvaLtmH5PwU3nEcO67rt0LKVk6KYWt19pHu40j62cuJnuPbWIctm3war3DPOEXTHdW9/iURAF
 cHFlyPanLjH2VpvmvyQ174eE4k1KGOyF1TeFVBV/c3Jghzxc2O7aVv53NY3IsrVPF/SxU25i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140210

T24gV2VkLCBNYXkgMTQsIDIwMjUsIFByaXRhbSBNYW5vaGFyIFN1dGFyIHdyb3RlOg0KPiBUaGlz
IFNvQyBoYXMgYSBEV0MzIGNvbXBhdGlibGUgY29udHJvbGxlcnMuIEl0IG5lZWRzICJyZWYiIGFu
ZA0KPiAic3VzcF9jbGsiIGZvciBpdCdzIG9wZXJhdGlvbi4NCj4gDQo+IEFkZCByZXF1aXJlZCBj
aGFuZ2VzIGluIGV4eW5vcyBkd2MzIGdsdWUgbGF5ZXIgdG8gc3VwcG9ydCB0aGlzIFNvQy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFByaXRhbSBNYW5vaGFyIFN1dGFyIDxwcml0YW0uc3V0YXJAc2Ft
c3VuZy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jIHwgOSAr
KysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtZXh5bm9zLmMNCj4gaW5kZXggMjBhYmM2YTRlODI0Li5hOGY5N2QyYjMxYWUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlub3MuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMNCj4gQEAgLTE4Nyw2ICsxODcsMTIgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkd2MzX2V4eW5vc19kcml2ZXJkYXRhIGdzMTAxX2RydmRhdGEgPSB7DQo+ICAJ
LnN1c3BlbmRfY2xrX2lkeCA9IDEsDQo+ICB9Ow0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGR3YzNfZXh5bm9zX2RyaXZlcmRhdGEgZXh5bm9zYXV0b3Y5MjBfZHJ2ZGF0YSA9IHsNCj4gKwku
Y2xrX25hbWVzID0geyAicmVmIiwgInN1c3BfY2xrIn0sDQo+ICsJLm51bV9jbGtzID0gMiwNCj4g
Kwkuc3VzcGVuZF9jbGtfaWR4ID0gMSwNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGV4eW5vc19kd2MzX21hdGNoW10gPSB7DQo+ICAJew0KPiAgCQkuY29t
cGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczIyMDAtZHd1c2IzIiwNCj4gQEAgLTIwOSw2ICsyMTUs
OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBleHlub3NfZHdjM19tYXRjaFtd
ID0gew0KPiAgCX0sIHsNCj4gIAkJLmNvbXBhdGlibGUgPSAiZ29vZ2xlLGdzMTAxLWR3dXNiMyIs
DQo+ICAJCS5kYXRhID0gJmdzMTAxX2RydmRhdGEsDQo+ICsJfSwgew0KPiArCQkuY29tcGF0aWJs
ZSA9ICJzYW1zdW5nLGV4eW5vc2F1dG92OTIwLWR3dXNiMyIsDQo+ICsJCS5kYXRhID0gJmV4eW5v
c2F1dG92OTIwX2RydmRhdGEsDQoNCldvdWxkIGJlIG5pY2UgdG8gZ3JvdXAgdGhpcyBjb21wYXRp
YmxlIHN0cmluZyBhbG9uZyB3aXRoIHRoZSBvdGhlcg0Kc2Ftc3VuZyBjb21wYXRpYmxlcyBhYm92
ZSBhbmQgaW4gb3JkZXIuDQoNClJlZ2FyZGxlc3MsDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4g
PFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNCkJSLA0KVGhpbmgNCg0KPiAgCX0sIHsNCj4g
IAl9DQo+ICB9Ow0KPiAtLSANCj4gMi4zNC4xDQo+IA==
