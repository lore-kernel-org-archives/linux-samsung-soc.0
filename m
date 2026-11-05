Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793842521;
	b=snyXfuDRBih+aG3sLT2WiqRKVQV/gTM2hBWqdkCXKQMPv9EkgE6sX9T0G6ZEQeMIvg6F
	 x1WN5v4dVi6qyqmMozL4AcHaQ3OlwsO+uRAzQmrNvL/CESL3wiPvqWGRkgS5shKWeGvt/
	 QxNGcjGc0HfvjsrO27i7vTdS0dhaHNrKOSCEo4f9yTq817wO5jffk1KzbLL03xi6VTna/
	 BjMaXDJF869W1ytcXZA2dz9OU6T4ggPWxBgAZ22um4FcSIKPOJqqeGij88+32kEjVsCIS
	 yzAqzAS+Vmb04TBllnFpU41jNgSAC0BvjTkta9fKRIhLJ0PSyHPXv14UURPfYdT2j5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rrz7znNDivt8s+Tumo0Rd1qIj9P5IkMuMEmQb4mo+zU=;
	b=jhPzTRdoiLAZuZLOWI45S40vuKspm4LBLQYkp/Wmejx3xUoyWyeLyoEYJ/RQfgQl5zs6
	 PqUFXqd3YXvdDuXLiVYjX8phkcmhNznYZYKJPWGuamVgqnyFUB+yyH108qGoLhvbOoqLB
	 QG5bVQZseK6WYorkjQmlfo78DgRELWsvK+9D+vfSez17mxybphEQt8mV3apxprho0V5/J
	 0nPG4HyYxA2xafdUibbT41gGz+FxLBW7HgUV75b51VblowCHibQQJ1AvsFzKtJHRtYbro
	 g3V22DFZcLA55VrOtSjDABIqcx9gv5FSNRaRBj7hSlO6ImhRse6kzOcSTfsc2ngCmQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=QZyTpV1R;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=UcYbFSbV;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gzkjH1gF;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92789606A326;
	Thu,  5 Nov 2026 01:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92789606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=QZyTpV1R;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=UcYbFSbV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gzkjH1gF
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oSDW3400962;
	Wed, 4 Nov 2026 17:35:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Rrz7znNDivt8s+Tumo0Rd1qIj9P5IkMuMEmQb4mo+zU=; b=
	QZyTpV1RiyNVigS8fo+XtzJKkFTMxUh7TvEdX4wrKUpve5QLe1wUCJqsWHJ0GPOu
	aq64biU14CpWgvnyo632BSckop94yRsvgv2wO+IpXTwcNy74aiSCyGCu8FM1MDHk
	ijs2v0V5VU7BZKex8Ql0L5/8WE1NYwR3QbupFPrSXz1DLgj3V142pAtVTOPCwz2P
	z00CXB9/aiMBqzQoDFNI6jYtdXAjgEWoO1d/COdt6ovP/ZcA0f/d9UyKze/HofWA
	LMOpVnGnonJf13/OActHZYuMb5HhCPDbuxB8TH4O7zyXPgDOG+2NXKfQeXJUDeLa
	c2IE+QmEX7Nil/gogHddwQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hrfjqgawf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 17:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793842500; bh=Rrz7znNDivt8s+Tumo0Rd1qIj9P5IkMuMEmQb4mo+zU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UcYbFSbV1DGd8b0OX0pNP2ZxrPoE3OS/HDrsULHSOkvShlWcWVYawiiz+QBXJEsom
	 6p7mbuDm7n/0vqFHPzq/mmBgs2zs38qzGpPZs4HWpuf8EU0QSw5LTWlnUwcx5HuQIr
	 zYBpo/FKu50vttdePpGFFaH2Li2aDfQYrnF+JJlItVCqR9on70NG7mdq68hn4Sds8I
	 P3P8bL5+r9Z7gOQknzTpDNrmAE5KIai+TBDxooseAAJfS780EMjO/NsVdqGFAPud5k
	 7Zs4mZieqePxeUmq8Aessp9CqYm6jlYrTq2FlDV1Icur67ZAQgQrbINnj4sjy7wwkw
	 A0N5Bo2vTAGEA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 629EA401A6;
	Thu,  5 Nov 2026 01:34:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8B97CA00D4;
	Thu,  5 Nov 2026 01:34:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gzkjH1gF;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00105.outbound.protection.outlook.com [40.93.4.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A800540112;
	Thu,  5 Nov 2026 01:34:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhu04vpE2GvG/YS0W82ZFEvHD5nnYOaSLcYYB51GzmRZurv6+WFCn9YjFi3fKw83r5QR34pL08sn2/jSAViSHFneGPLbCg1foKeCW4UlW83T92ajSgAyqEo+8M6LgL+N9sqL6RUkKFC3nKMEBpIqH2gbtMJEg32kVxFPoNKwhYrn6/WY64OlIMMM4/EfkMRQMGbP/ip6iN2jQNWaTdyR25fWHkiXWn10kSqjpCIQa8Ifu+DCHqzD0nR61z9FFbYKJWjq7OTSprc6pgi2gEWnGvNOIT7z9lawMb3IXugu9qorj4kpAhXTq9S2OUprYBs/VCO+6phCbLVNllw5mVqplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrz7znNDivt8s+Tumo0Rd1qIj9P5IkMuMEmQb4mo+zU=;
 b=lyZqdoCJvQUCweCXVx8BjUxjlS0JHQVi9IZUafIQ9Wc1QWZgUwCjDw4S7ETjoe/5N4PXEbokEYSeq9ltFfvG++M4lCvhIzcDE2o1mP/m9Cul/9NxEopgZ5vv15AzQr51b9jEvmwIwdSHMwJJC6TfEuJC5F3KGghRtKq31SYpYS/dUvDq54x8RDtx7g+AS1QwcOu2A4CQnU0dkF1tqIfGpKkBoN/jH7d1iIXmZpfG35RBu4zobAQGJE04oA/mgeOWfq3yy+1Rtq0oYDzTMR3tv6WXUoRT7hthYizSNYBLDLVQMwc0zH+mqQGX00mAY7Kel9T9fUftp+jYpBrr+beT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rrz7znNDivt8s+Tumo0Rd1qIj9P5IkMuMEmQb4mo+zU=;
 b=gzkjH1gF2F+qBCANQ1eOghMaBop1HIhRxuscZ1tps0QoNAInK/PysJCXZu7piW/CmZI6W1ShKVEIVnVRUuGHt1pba6Wx2QimnPwdGfHcIcUXF7peqnfcxvJtyijJ1D6N+MXCzQhZn6OX7iOYwjpnYQx/MwiYQsPBR18oqUvMWOU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 01:34:51 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 01:34:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "peter.griffin@linaro.org" <peter.griffin@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
        "h10.kim@samsung.com" <h10.kim@samsung.com>,
        "dh10.jung@samsung.com" <dh10.jung@samsung.com>,
        "akash.m5@samsung.com" <akash.m5@samsung.com>,
        "hongpooh.kim@samsung.com" <hongpooh.kim@samsung.com>,
        "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
        "shijie.cai@samsung.com" <shijie.cai@samsung.com>,
        "muhammed.ali@samsung.com" <muhammed.ali@samsung.com>,
        "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Topic: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Index: AQHdZVIPil95GTrwGEiTWIAzrIDHPLcewN2A
Date: Thu, 5 Nov 2026 01:34:51 +0000
Message-ID: <auvcLYl-ZnagU-7H@vbox>
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
 <CGME20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d@epcas5p4.samsung.com>
 <20261026135715.33071-3-selvarasu.g@samsung.com>
In-Reply-To: <20261026135715.33071-3-selvarasu.g@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SN7PR12MB8002:EE_
x-ms-office365-filtering-correlation-id: 219bade1-2001-41db-4a68-08df3adcfc8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|56012099006|11063799006|4143699003|261102123227099003|261009223027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 zYmIWU4d8GjxhnzuRZUbUNjURb8ecXHUZ5WGGTEciHEPz1jW24a0W4haq1R+wVJ1Dv1JJ+DX0iAF/v44SEMjJhklFny9a+DMw2pw1pFMBM6k8XO6NchAQYZoR6mSOy6eHnxs2hmewGUq/Wjf4qnFRayj3IKPonn7jzX/gTCMDMXre7BaCZ9AnQQa5LzE2+jqFDOhARQcuh8hr8gCNR0wvdtxyL73KKktdqc+lCexdBnYiQGYugQxuOM8exIoY3js50jwPtdfOcYr2zwRQ651HnzcHK8zw3yZHzqER1xZSrJTwj5MNI0V8CMd+a2jVgY/m+DHyDRSeW/dp2A6WRifd9ZVGeciKbutJ1t4y9G15rLlJPumz4wc0Hy1eZwstaSB7vER9JnqD6nWlcnnjgYH2JpArsvg/kmPaZXIQdQuFgiUadInfozObuSIRfJ9Z6T3CvOxP1N6Pq7BBqAFqDFDsWeUY7tVz47pDEK2CRKE6ieCOm9Sb6NCaThAf/VlCfxuhwA9cJvm3YbIaKRTLRjHPDzIygYoNghWnWFRGq/V1/WYVL7J819cUgXwfU/uVin2BzqAdCwbHZVGktCBqb4wSqP4XatYjmxTfpxBcLEg/rCzgheBRFtgezBjNWt6L4N4su6szG2xklkj0yD9SwpKEQPRDuqejBXChypzLwxG+kTSz92j2Vw1FjPdD7E/g5kHPq1TKLIi6TXDdhuaiNOirw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(261102123227099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUpBa0hNNjdUSm5BSTc2L1NsNVYrKy8xNzZRTWJIV3FzU0E5dGkvazhVMEIz?=
 =?utf-8?B?WTJvU3JkcjQ4OEdkVFJMczlDcHl3cGhPUWIvOG5sSmI3NEZWcGhld3BsaFc5?=
 =?utf-8?B?SjFhZVJHaWEwaXFoWnVlYW4zQmdwUEY0dnQxWUZmd2ZOM0FLWFM2RVZ1Q1lu?=
 =?utf-8?B?ZGo1YjdCclFZZmZsd1FxZk9mcGZ5WW5kaUo1OGYrM3Nqa1dDakJSd0t6a3U3?=
 =?utf-8?B?UUF0V3J4U2xGTGdGVkRUdi9aRG5CdGREQ2VrdVZiTXE3QzExSnp1ZUc3NUlO?=
 =?utf-8?B?Nm9IQy9CS0ZqaVdDMlRlcHNRZzBXY2ZwVzFTbzRKekt6REVKRTl0VVliN1A4?=
 =?utf-8?B?QktXb2h3WHpJUUxLeS9FUEZ1ay9WZUVCM0FmNG9ESk5PaVFGYmxkQmRNY0ZN?=
 =?utf-8?B?SysvQ0RlRVdsOEhnWjZ3cGFNYkxYNHRFeGtPbS9LZVJVdkcxWUtHZ1dGa3ow?=
 =?utf-8?B?amNnSXRLMUsvTVpNQkJURXpKTVBYM2dRdW56MGxMaGhMN2JURkZTYVk2Y0Uw?=
 =?utf-8?B?c2VWWW9ZdHQ3MVUwNTRVb3VOQStpSVlwQnU5R25wTVRPbTlxcmt5cDhQR21D?=
 =?utf-8?B?UkVzaDd0cmxPZFVGWkc1a0tkRVI1RkNrb0VKdUhGdUpJTUppQUZqRlhMSHAy?=
 =?utf-8?B?U05SL3U3UTRHQ01jSWV2b01CT2ZUL3plWmFpK0ZVc1NhV1JoOHdpdU8xNU9z?=
 =?utf-8?B?SHdBNi9wNWxEZTA2V0VwTXNKeS9FN0VRR1VMUkJsUXp1cTRObkNxQ25rYm1C?=
 =?utf-8?B?UVlUcVdkWTUxUGJUMUNQTHZLMGswQjhib0h4VnlhZVlSYnV2dWw2ZU5CcG9r?=
 =?utf-8?B?ZlU3S2htTjRuOU1YZ2pGU3kvTGFzY3pIaVd3YkdFVUgxQlJoY0lnWHFUa0RK?=
 =?utf-8?B?Vmw5V3Z5WkVtZmhBdWZ0UndkbFdFUmRNMmRtWW5NN09IS3Q3UEozdlVFQTNO?=
 =?utf-8?B?T3B2NlM2T1hYTjcyUVpCTXhZdXJYNTgzWm9YM3ltL3JPV0xlQzdwLzU3R3BD?=
 =?utf-8?B?OGxhb0x2bVBHWHFrNlBNUDB2MG5TYit4ZTJKRTNvL0xOa1N1TVI1a1VyMDhP?=
 =?utf-8?B?bG9mNDV6ZnRHMzNGWkdmV2Q4Smw0YkpRbUMybExHRVpMWFJSdEJleitBZExH?=
 =?utf-8?B?YkFUVHMvcndTK21uejdLT0hwTmpvSjlZUGNrZ2FhVm1uQ3JseTZpUkJqcHow?=
 =?utf-8?B?NXdRRkM0U1Y0aWhJSjd1T3B3eTU0L0Q5c3N3Q25wYTlteEFNL3lEOWltdVZR?=
 =?utf-8?B?dTU3T0NLRTJQOXg5c05xUVZreCtoUXN1NlN4eU5Ma1pWQ0FzYncxSHFUZzJo?=
 =?utf-8?B?ZVh4SEY3MHF1dms1TDJIRDJnOFpGM3djTWx5c3htSU9QZzM0WWtDcEhjaDkv?=
 =?utf-8?B?d3EzN0llTFdoWHJsRUVWalZqZXVxYjAybDZHQS9IdE1pdVJUcFVReGFBQ2Vw?=
 =?utf-8?B?WG12WXdEZ3pONy8vcSs1K09KclNweHlJNVovTW1lKzJtUHNSVjJ2UFA4Q0pR?=
 =?utf-8?B?bFBDb0g3dkd3U1FqK3JmS1FBa3dFRVhTMWYzYktPV0lMSi91cWdYeHo5bldw?=
 =?utf-8?B?MWc1aVBMM3NQaTdmR2w3eE9KeXQ5UWk0aXdMRWZmaDJ4eC94dXZFU1dyTXpS?=
 =?utf-8?B?SHZLVmU1MkN6TTVvNXNCNXFvMTN2cFhRTjFrNUlGR3NsQ2tpYmwzWXFKeSsr?=
 =?utf-8?B?T3p2MGxBYmZneWEyQjh0NkIyWmJzTkR0SFZ2QUpnbUlWa1I1QWs2SHRFQS9P?=
 =?utf-8?B?OGNDbnplNGYyYlJNUEttSlB0eENNVjBmT0dKNmtuUi9Cdnhtd2pSTkFDV1pM?=
 =?utf-8?B?eHBrMUd4c2VoazY3aEFSTkErTnFrc3lBaXpOaC8rRjYvaThiTnlWd2wvU1FD?=
 =?utf-8?B?KzNiUFQxa0FZdWNwVUljSlowaWxhRTI4TTQrMGU3RXlSU2NMUDFzZUdYTTJO?=
 =?utf-8?B?SXdpNnBJNkY2cUpBWWd6cWsyUk1TZUxWdFR1R2RTUU85aVFTNTlmM2V6aTJY?=
 =?utf-8?B?dzVUMUlUWGd5NTdtTFBlNVRram9ZQ0lOMHcwSkozYlBZb1NvSlZRcXhMcVpq?=
 =?utf-8?B?MENaYjJnUG52bitsZjNPaDZFOW54V2V4K1NrK0VOODA4clZ2L0kxelUxQk1j?=
 =?utf-8?B?WVNRbG56VWMyMkNBNjMxa2kxN09OZEFUZ3JKWk11YVVXSkZTZkdYNUkrN2pY?=
 =?utf-8?B?VEtsL1NwbHVBZCtIKzhkY2VLKzU5Z3BETEkrMGo3a0xQU1UvNmI2STZMK2dI?=
 =?utf-8?B?YVZEdDhVbVFnSmE0ZjZzVUhKT2dzSVlsNEJjN2dMclhMeTRheFYxTEdNa1hO?=
 =?utf-8?B?Rkt0ZTVuOW1kM3NLNVBWQ21kbTAwNk1xS3JBNm9ibTEvVVR4VkRxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE185F27EC444243A7488A7165DB868D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jVz1VnZgdgvH2NHD+trYTMdnxQTjO50iuKdPSXleaS+nO4ndnLVsz4eT3nUKWua59e7Z7L2YOBruiVJKNTxXSf7cka97oP92hwmbD9xWwIEmL5nz16xETaUIWhakVIt4HEIsB6+3JVl2gifREcxOI0IEOhGAbRQkGD8Ls55uCEsDoFHc45AlYcTbJAuRkHosLTPV7knrcveyAECBIT2l9hPKorg6p8kxhb0AUP93a5a9yGiwQVu0wSgtu688f6EVAyTbTrErbykU3GEsJnqJyLpJw8IxW1UEszTa02rWAVCq8T8WPFCjMlYZfMranSBtX3Fssl+IOA+zHAS2rBRYmA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O3nk72My9zK2EjEtXFLlGSVxfEVqQaPQ+1n8jiCUrtqRaGZXOXmc4GqkNzutr+0QYk06H6hPjH4A94JlsfOwC12dVs0o81V8DVwyAUPRINa4IPd3F5EpX670lupD7PbDp0NhzSAbcv1s0aPa6U1mAlXTeWDM7us4yACL9DsYTHCsD7eIH3LHSpkriL00VRuE+6GWfJ/G1TeUBmnPbiRWWQES3TaoVV0s72nT9eZI1TM64aHWMNGHjAcOYGKpid00hAJI35UZX0nFeVJCerAMQcfZ0ZkiGAdSgFVfViijqkOjgEi98AWyxFb8oneKDDDN8y71GD7tOvPUCG16xfQu741USzKIJHJDmUX/pncjTziZ7k9Fql+9jUSZudWihbKRRaDr5YbEHf6ZlwVZWr9seBranuHQZxYLm/WJ1ON3Nb4Tmtw/uM2+CS/FKnFyTSgSzGNg59yh2kF1Cj+BpquCHL+NJJXBTxPZkIXWJyi0lAtLJW26a2XPk7PdEUu0z4GCjkBAo1wAUb8zOFgQ1Jw84QzEV8ckoEuPZcZp6X6szabI71Uzn3rvUx65qkst0ORjsr4J/yXWyN8MiYSB+ArFhG3xu9wx0kYV35VQpeFRwQQ1IihSuELqTsps2Lud14f7W71MVHnR7L5ld4v6UEIs+w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219bade1-2001-41db-4a68-08df3adcfc8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:34:51.3981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4wFsvSOIggkdgBp3dljVXsm4vlTH7v7iOKTgTof6lLc5JYLFuPRVAx1w/Hg0ZAyvNhdm8F1v9B3X0OXa4hnVCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002
X-Proofpoint-GUID: 4COVYEZXRmK_NO2xgZbmFHz9OB4anozb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX2mk/NYQE5DUH
 SAf1tLSPEKnINEpng8eGldGlTc3nH+r3J1UXydRHuoehbkbQfQnzswozjIjDpDxESjSkCUvWqjy
 zdkdyrw9Pi61heUnQRQhPLVXSvI4GAw=
X-Proofpoint-ORIG-GUID: 4COVYEZXRmK_NO2xgZbmFHz9OB4anozb
X-Authority-Analysis: v=2.4 cv=J6s/fwnS c=1 sm=1 tr=0 ts=6aebdd45 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=ld0PRA7CJfKWxZq3GrgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX5FjEM9y4DmGN
 jFtuDK139O0aEkunBWrFpOj0bpcnITS5ywhpkQURGOJj3J+rf47NUQbL1C9iQlfkJsiJV2INJKW
 63fICmi9eBfD8ww8OGcaSc/YeFgV+3/g0MkfrGBh5cwj5S1MvqsWwNvEic3LDE8PloB3feiv18B
 6CBULEqi9JK57e1PTkYTZ9WBTD/qY3jEIq5sz4wGB4OHf6iPbt+fiYBo8Z2GvdtgIwK/DmXsVER
 7DJVRsiBoXFIobB1KBpH+XHsTatEZn/xIcZiun6anh7hnTYff6xXK8HDIaMJ1YmDLb0jTJbQp27
 NZA+8Bpiq4uS5MWuA6N+gKVW5OBWGb3dC/wD2ekhcJrnaHpc+01vGXqeJ8DTbjPL5VF6QaitZYm
 6dEY7ylBfudy5o9aD8QV2rYdZN32dmbkB3qpHUvpq4fa9+F+TjU1cQDOnFY9nstnwkH6Vq5W6Av
 YSOzq3nRY782e95ACXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611050005

T24gTW9uLCBPY3QgMjYsIDIwMjYsIFNlbHZhcmFzdSBHYW5lc2FuIHdyb3RlOg0KPiBBZGQgdGhl
ICJzYW1zdW5nLGV4eW5vczg4NTUtZHdjMyIgY29tcGF0aWJsZSBzdHJpbmcgdG8gZHdjMy1nZW5l
cmljLXBsYXQNCj4gc28gdGhlIEV4eW5vczg4NTUgRFdDMyBjb250cm9sbGVyIGNhbiBwcm9iZSB0
aHJvdWdoIHRoZSBnZW5lcmljIERXQzMNCj4gcGxhdGZvcm0gZ2x1ZS4gV2hpbGUgYXQgaXQsIGFs
cGhhYmV0aWNhbGx5IHJlb3JkZXIgdGhlIGV4aXN0aW5nIGVudHJpZXMuDQoNClBsZWFzZSBzcGxp
dCB0aGUgcmVvcmRlcmluZyBpbnRvIGEgc2VwYXJhdGUgcGF0Y2gsIG9yIGp1c3QgYWRkIHRoZSBu
ZXcNCmVudHJ5IHdpdGhvdXQgaXQuIFRoZXJlIGFyZSBvdGhlciBwZW5kaW5nIGFkZGl0aW9ucyB0
byB0aGlzIGRyaXZlciwgYW5kDQp0aGUgcmVvcmRlciB3aWxsIGxpa2VseSBjYXVzZSBjb25mbGlj
dHMuDQoNClRoYW5rcywNClRoaW5oDQoNCj4gDQo+IENvLWRldmVsb3BlZC1ieTogTXVoYW1tZWQg
QWxpIDxtdWhhbW1lZC5hbGlAc2Ftc3VuZy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE11aGFtbWVk
IEFsaSA8bXVoYW1tZWQuYWxpQHNhbXN1bmcuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTZWx2YXJh
c3UgR2FuZXNhbiA8c2VsdmFyYXN1LmdAc2Ftc3VuZy5jb20+DQo+IEFja2VkLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIHwgNSArKystLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gaW5kZXggY2E2OWFjMGViMDdjLi5kNTc0
OTY3MTYyMDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBs
YXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gQEAg
LTIzMiwxMCArMjMyLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZp
ZyBlaWM3NzAwX2R3YzMgPSAgew0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgZHdjM19nZW5lcmljX29mX21hdGNoW10gPSB7DQo+ICsJeyAuY29tcGF0aWJs
ZSA9ICJlc3dpbixlaWM3NzAwLWR3YzMiLCAmZWljNzcwMF9kd2MzfSwNCj4gKwl7IC5jb21wYXRp
YmxlID0gImZzbCxsczEwMjhhLWR3YzMiLCAmZnNsX2xzMTAyOF9kd2MzfSwNCj4gKwl7IC5jb21w
YXRpYmxlID0gInNhbXN1bmcsZXh5bm9zODg1NS1kd2MzIiwgfSwNCj4gIAl7IC5jb21wYXRpYmxl
ID0gInNwYWNlbWl0LGsxLWR3YzMiLCAmc3BhY2VtaXRfazFfZHdjM30sDQo+ICAJeyAuY29tcGF0
aWJsZSA9ICJzcGFjZW1pdCxrMy1kd2MzIiwgfSwNCj4gLQl7IC5jb21wYXRpYmxlID0gImZzbCxs
czEwMjhhLWR3YzMiLCAmZnNsX2xzMTAyOF9kd2MzfSwNCj4gLQl7IC5jb21wYXRpYmxlID0gImVz
d2luLGVpYzc3MDAtZHdjMyIsICZlaWM3NzAwX2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAi
c3RhcmZpdmUsamhiMTAwLWR3YzMiLCB9LA0KPiAgCXsgLyogc2VudGluZWwgKi8gfQ0KPiAgfTsN
Cj4gLS0gDQo+IDIuMTcuMQ0KPiA=
