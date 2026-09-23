Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F046D358D37;
	Wed, 23 Sep 2026 02:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129026; cv=fail; b=iWpt5byt9GcajpNJXsPiJ3MfkEzgnxxDtELrnq7ppNOCw2ApVwxvHKLuy9f9V54PzNa0orkc4rWBFiGJ6ojbV+5UxX3gm8+MDkDR8DXc0ShlbqgoXm1RVR6Royg32mGJZFvCaRgQUkq4lw87mS3cdlsa7QbNw7hr/DiRRna2iHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129026; c=relaxed/simple;
	bh=9MQSDkYglwHgUsb6iTN9U8GrMwg4ihEaQbEKdteHtG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ciMtOavzqcJq+f4zyxVfwr93yp3SSmECz21sIhROpbrC4N1lhCrQeqEe1jH7VqZymP/bWfWWmMm10RWSWvVWiMy9nL2ZoDA27CLnYYDmW8RUXzqwgG/XZa6qMZGkn8afLKo8A3ZaHzjeS2q2zcJk3du0kWHqbAh2/ikgv1G5EiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dliAS3Mh; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W22KSgld; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vJb7/DFS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dliAS3Mh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W22KSgld";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vJb7/DFS"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MK8nj9404927;
	Tue, 22 Sep 2026 19:03:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=9MQSDkYglwHgUsb6iTN9U8GrMwg4ihEaQbEKdteHtG8=; b=
	dliAS3MhtmhdBVh+YCYvCCP4U3OzSAYNfKPqK90yVFESy4L872QOa5ILsXf/4vya
	1917EghHNe+elyZbWJpJn9JUSVA51j03quLL9NPa/PGDDTR0Q52cNtnPSk5a3Ppf
	uyp8QnbgLadG7iArQ0U577UGnZT4M0qNQDeEXumjtTUP66uaqPr1pcA8v+37tJIt
	JzxWAby26OW2rgV8uo62b3T11ICkugFrcDH5pVm20meHVz1QqgCN2HZ8eDk/v6CB
	jr+zaT6wEl2L5MrDaoJl3N/Ft77hBpg58pp93l2P4UkCSSPeDkpBMhAfaQUvGQRW
	VmQM36kz3CsQy7xFgJ8TiA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4guw5641h3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 19:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790129001; bh=9MQSDkYglwHgUsb6iTN9U8GrMwg4ihEaQbEKdteHtG8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W22KSgldwtVb8qKLIPl94VzOmWDOh+tBLZqin/4w7xPRcxXjT6rkhLkFTzOj8oZW/
	 kDyzxf/gjcWaM1HMgvVK5FFIZ91jhPDLY9W785zLsTI3tvxHrG0bq90tDUauMnx60R
	 oinR8j8X+7FNywbbCB3zxKwmisyqmfW96n50STEus+kh7H+MokWWGYDVZMpy6UhQeR
	 YvBFWzk0w2j1YkBu2J9CKCoO3RmYVPg0ukKvwdvRmgBMcOHWr7rcwEnDcBmCfRvziD
	 6OCJk5+1MDdr80TqjfavvSQNEuacFFvAOHRbcK6U32Q4i4NX9qUAFzT1IdVJqNhOe/
	 dMIjuyVUHRWdA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E164C401A7;
	Wed, 23 Sep 2026 02:03:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A23BAA00C6;
	Wed, 23 Sep 2026 02:03:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vJb7/DFS;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00601.outbound.protection.outlook.com [40.93.23.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 44B874024D;
	Wed, 23 Sep 2026 02:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bs344i0I+vBuXoxkMI7q5pL+pzdyRxUCs80yaU6JxE7lYdQx16dbObX5ypzxt+SgftFnm1J/gCJR73iHcr3gg9rWEI4FQ5usOff32M+J4m8Pr1DuXkgk5l3QEyVWsuVmuNxGJlQOcBJ8Xf4uackaDXTgSbXVCjd36VXXw7kK+8cOuCZn/0AUcTjV3iDsSzxnJn9k2VgK0Xp9y+uDCe4o+xXdd9T7Q5OsjMkjhbFDtfr0WoM4JLm0+hQ7i/32zs626FRPk/pGR3lHB+4hAFkt0ZFvulCe1etPQP1t9MTk1cEj1QqNWPysUmxDnEvfo0uoXeuA12ZfHdWdkRhwGlXdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MQSDkYglwHgUsb6iTN9U8GrMwg4ihEaQbEKdteHtG8=;
 b=YJREHOyGO3u+3c5Cv9P+UQlur6EyiK4tChnE/DmKeNLUKOdZhC0ampscXrIVR6qw6U3IdiOK+5F91gE0JmObEMRkrlfDk4lUbb6LDQO1jRX048Zi3W8tvB1RfSlU27LCTSVMEGhrpoEjsR7IH/7amQtCaoFZ0e6OobeUCz+9Omaufur0N2P2YY9DFOIzfps0y9yfpQWNpe1yBjmw8JaMRziKa9cNSWJ5TLQk6J8/Fz+v1bx0MCT9DxFswt0kPg++A8bH15PZ8CpFGd5Irm1zqsxNydx/K44lSPc5B8j9LWewDXYG0Oh29EZ80oxy+3dMfY3caV3YyeqpTv0Mxkpyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MQSDkYglwHgUsb6iTN9U8GrMwg4ihEaQbEKdteHtG8=;
 b=vJb7/DFS5naY6hiI9YqfQml2tbPYLJTcsWnBoUXj5Bdeq0Ig85UZVhPbQ7PcMqALTdSb8qShGfSkGC0OHPDIUtfZg8YYKk+nNTzHrvlertUTgGOWG4+oxZhDvti5N+9g5pgm6TYxDLIUDn8hTRX/0Crnog4sAYavbohcBQqM+CQ=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 02:03:14 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 02:03:14 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
CC: "krzk@kernel.org" <krzk@kernel.org>,
        "peter.griffin@linaro.org" <peter.griffin@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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
Subject: Re: [PATCH v2 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Topic: [PATCH v2 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Index: AQHdRdZINDijl952e0C6T4ZAAd9Jtbbbc7UA
Date: Wed, 23 Sep 2026 02:03:14 +0000
Message-ID: <arMzV0YRk2pSmcHp@vbox>
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883@epcas5p3.samsung.com>
 <20260916122229.2604003-4-selvarasu.g@samsung.com>
In-Reply-To: <20260916122229.2604003-4-selvarasu.g@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CH2PR12MB9496:EE_
x-ms-office365-filtering-correlation-id: 992e2f48-8476-4a88-98a2-08df1916d416
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 N/2cccLxTZXppbln6xssdko8zJNDUL0nDbzW27aqZUbpeJoPqayP41P2nK1ngV8aLBVtQGOmKGhKu4Grl3YxdXDv1h/H/urgI203Gbp9BFfeMIPiTLaBI4eGy+a2FWtEaiMzA9tXx5LFyP8YxY15YoNhpCN28FrnEA5P6DnpeOR3a1FavJgvkQEKYMfbV54x1rn4+Wg55TTAU3MDCUJiRSAQrBQ/OYD6W5/8DZT6kc/zaXxPFqIG8taEuRpHC2j8foUTAFguM44aMnF8o2xQyrTrnbwybiOyzBGBwgYj0ngQv9nQulkJaDO9BJLeSb3MSf+B8w2P7VisZxSo7Yjj+Izgv/9PUk0tfZNMSZhr4ZWmt/BzLNhz0dDw5+oEXM7bNYmOgfvXHerCXY9ePSNr8Kjtc0EggezkLJmdBRJQFwWC5jy1+P6PrCJOueB7ROGSbbHF5SE+raJAwO5qdV2PItbgucxfwkGQkTSq3KT3EQahP9GwXEzIcHN4rkxbVz5oRhTX9hUuedpwHWRW50O/JtwMFRnWxtJMh2jDYSHq5O5c/c0WjzVPJrAVKGfFEocp82OGiWdYPPsnm1G0eQ2fK1HGQfrGQFYL+9qGOFlz6pqWJvBTq0BSnUU9m+kjovmT0qzwi9A3sAQbmQ0vdQeIUXrPavOusCvs/bIwcxK0Fd6vgsv7x6wNagUJWcBy0KmT0ma3uLB3IRpilyWcDLcxxhwpAciVGfQeGOkukRX6nBI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEdxYTJCVlp3cDlXb1ltK2dYWTNVYmRJRXNCc25JVGVBWXk4SUhFMzNvMzFL?=
 =?utf-8?B?cUo0QXNFNGFWcll3ZWRNdUZMR3dTMTBFSE85OUlsQ1NqUEdjbU5nQ2RmR3RF?=
 =?utf-8?B?US9vL3hnTEVKZEkrL3VBSEp2Wlp3a1IzWlZDVUpCQUVtMUZaZmZzYkNyR3h6?=
 =?utf-8?B?U2FSNHQ1bHArOXZvak1hNU8wMStmeDl2VmViTkFEbTdyZkNVdTM2WGg2KzhH?=
 =?utf-8?B?LytiUm5DM29PSitSZVExNzFnNWtheHRNK0dwNXdwam92dVV5YVF2WHZyYU9m?=
 =?utf-8?B?Y3pxb2F2ZFZyU1QyazhmUHRTMGtQbFVtV3d6QnVrbzhRalFjTS82VVlMY1Zj?=
 =?utf-8?B?SkV5U1lJTDhCbUNYSWs5RHYrMi9ieHhmWi9xUEJNVE1EMU9QT1ZsWFdHL1Bt?=
 =?utf-8?B?clFjWWFnaTlnUDF6ei9GM1NlQ2M3R0lhc1NBaEFtSUczZU9JVXRiNXYvZmZr?=
 =?utf-8?B?dWtNaDFETWQzUTVvSUhzamVISjR0MFpBUG50ODJWQ1ZMM1ozcXQ4ZCthd3Rk?=
 =?utf-8?B?QURiTVlSZTFWSmhyUUJJdU8rdHJRYmpVQ3drM29NZ0RwYTc2aXZEM1dVd05r?=
 =?utf-8?B?ZVdFSTRRekNkQzB4akJHUWlTMWFOdVM2ZmRUM0ZSd3BPV3dUSVZyK0U5ZXpJ?=
 =?utf-8?B?ekRQbzNsOCtNNXZrWWg1aGlwWWJ4TGQ3eEFybC9adHN3ck12YXVzVlo0bm9r?=
 =?utf-8?B?Tm5XbFJycG9nUFFVekpaT2hHRlJrTGhFOWpZN3pvUzdhY0UrTkZncnE3VkFT?=
 =?utf-8?B?Zys1N3dvK2ZNTzJpZGZWMkt1MmQwUGloQU9MbnBRU3RRN0tyUWZuR0pEL0JN?=
 =?utf-8?B?WE45aENkN3BORlM3Uzc1MlpBRGNMNE5CaHEzSzIzRkJUZGhvNm96N2dDbG9u?=
 =?utf-8?B?RlorWk9NQWFnSFF6RjNCQ1hLcTI1RVF2bGEvWlNBNWs5Ly9GOHNyNG8vdllr?=
 =?utf-8?B?ZjVhYU1zTGVvVHBJUTQ1YnBTRXlGb05zazdlMmErVUdqZ0UyNk1vYXJqMUpk?=
 =?utf-8?B?ZjViRlh5U2FoWmhhcEVVWUhFYytJK2M4YWVPL3Z5SWMxRnVISjJ5WU9lZmx0?=
 =?utf-8?B?Z001VUx4TjEyWmlveCtLNS8yNTEvc3o3d010TE5yR2dkaWgxUFhlZkRLSWZr?=
 =?utf-8?B?QUZXWERwajJKMTE5bVIzQWxxZDZhSWVvUmFmTWNrUklCRjZWUDk2NWw0cS9N?=
 =?utf-8?B?OTlVQU1ZUXhCRTVQRVJuZFpZTFZ4SHo2amRCL1ZPck0vUHlzUDVmTGJnRVdo?=
 =?utf-8?B?Mlg5YVpuejdPSnVucXoybmgvL0R6aFlKRjRqcjhzbEFtQmk3VzBOOG9Sck9O?=
 =?utf-8?B?bHJ6cjVOc3hScW9KcEZzK3pkcmw0d2MyNisvRS9Zc242WFdMN0w4UU5EYlRr?=
 =?utf-8?B?SDhWUXRFZWFDV21VR0lxbFFmeEpZUXVmMUE5cm0xdDhBNmp3MUQ2RWNCemtu?=
 =?utf-8?B?TDhhQ3F2QlBOa3A0WHB2emRVeVp6ZzluVS9IMkJqVW5vNzEzTXRITzlmSXNN?=
 =?utf-8?B?N2VsbnlPTEFTVmI1cEVWek9YaldWOTV6eDBEalRHMFVrUEovLzM0VngvNXov?=
 =?utf-8?B?SGJ2TVZyYmlmSW9FVTVVbFZZRFhEblNpdEJjM1ArbjVGcmcrWk91R0VNTitO?=
 =?utf-8?B?SmJKRUtaMXIzSzVLOWxXZlNBQUI4V3JDY1k1K3ErTGRpanZZbHNiMXhKTFU0?=
 =?utf-8?B?YlpOQmJ5M1M0OFdPbFNsQUZZaUR3UVZXZWpOMjlWN3ZERTNGQ2R0Wk8zNCtD?=
 =?utf-8?B?eFMwQmZkc0JHZ3hkcEh0dnQwT1JJell4N3QzM3VpWndhVDg4dXRqdzNJSE10?=
 =?utf-8?B?a0tUU1FqSVRhK2NXMEFvci9yMHFJMkIwY2d1dDA2OUdjcGVmU2V0MS9leTBO?=
 =?utf-8?B?eGpTNjJuTGJTNmVKSUN5dHZvYmYxdG5rSnBUSzVUWXV6aVI1eWhsc0luNURo?=
 =?utf-8?B?bXMrS3R1MTdXRE5JMmQ5ckZWUk9EV3ZsSTFRZ0s4amc1bEdOS1VGYXBiVGhs?=
 =?utf-8?B?NkxSdWdVUHJIUlgzTUR4bnRhZncyTFJIa1Q4UDg2dEpuZnZkZVJyVGNOL1k0?=
 =?utf-8?B?MHlVMmdTdUlsejhpcElnOSttZzhMbGxHaHYzc29lMzVaZDZieE1DV3lVSG5V?=
 =?utf-8?B?dGsrVTFMTjRXNnlCM2NTclFvMkl2cThLZUFBcDNPS2wvOGdHMkRTbUcxTmRO?=
 =?utf-8?B?blpsQThKcjVnbmYxbStiRGFWNmc2TWdGNURKWXJ2UkczODRnNUU1a00wczda?=
 =?utf-8?B?NGtpZG9yZWVBaUZ2ZW43WjJNQWJUL3I4RXZ0Q3pKaUZ6WjFmc1FhQjRCYlM5?=
 =?utf-8?B?S3lVTXlQOXkxSi8wcEpBYWtPL0xCL29UMXBJWElpeWN0UFZGdlJ1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B95272B0CB92D1479C6DCEFCAB927CFF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jUUH+hxUcbto5l4XkdG9a2DA02/cSADttwxiGwmBRWzimSA+K3Fv877JfqgGvhFAN+GDRe8QrTBhviMokwNudZhfXZrlbPgXAuOI2dDB0ip7wmniwlw4VaNU2ZN2JWzsaiLYKsCNQSZhvBZbQqUsBNRiA6+MZg4C6by9Jmko3e0Kl5YS4ImPcFYYsrJbuDZxn7mXtsfim8SnSm+OBzAM9SLuq8vBoOYilNpnIEIls3Hp2X284z8E38NYbZ1TWJ2sZm50rKfGuqlvsUfjKtghAXjcL/qfGM5ALyS2IeJYt/yGOECVg5ZhbLvD0/fyByIpDRbcFRuJqdPu2o85InlO+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3PgRrv5EdBQEEW+2q7L2RBcRnmehKh/D0wQXhQUsfO9cX5Mdgaw5k8FmtZ3XB03ye6cP+6A16ikc3ZiRydBim00DezH0Omxil5ZjujqYWqy1bjobsrdvDeUe2KVGmpXjSGbrWU+QsRGspFjKCN2JsN8Zl5Lf7GVM2hZO8KdUeZW3Mn2EOqk8vqUvQm6W2lOCJPir/9/DyF5HdaAX7a9eerKpOgyNN4+0aZ2mj4Y4gteek9cRotJ3nznknasAshR8cqIXc9ku+8eXXuIxvCJuCZKE6eRokuAf0fArNX8F88D7hyrBn/4EXli8uyr8dt3eKAKQLBwSDSblVo6PV9gigTnGjtfd0ymRvBKUtx8iIW4k20fOtNo88pFigF4EYg5b3d1eMunReTk+5LM7iCxwIDTGmws54HxRIWuYILfMMhqMceCJQWZ6PUwGnjdbPnlIbPiPkkKAYIm3jtSFrP0zXW/JlfdJ8Fir7AQamHonLfDCQfVr5P4q1zrOGdf1jSO9S/iUxp58heHZhrs8Ab0SCbpAN77H+aAD6hqqOndKwWpsnqIYiaD8mJQr6ToY5gpQtOUEon9PS+2WrENl/SXijIyK/E5AJWTMRUvp5FTLh/4pzFy84D0Y9pJ/Glj/IESY6HUcZ51loSzDsrtoUkFj8Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992e2f48-8476-4a88-98a2-08df1916d416
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 02:03:14.7895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/3/qPUyYI7krexxm0Ftp7/R3oVDPhTpElzU1TPZUIjsaNauXXXLZ9wx8Xey1DHk5njVbu6Sl1V/3nSjgVo0ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496
X-Proofpoint-ORIG-GUID: Ro8pCYiH7wRmxRP3ElRXcattd8IwT3HU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX+pXk/ezVYglQ
 33AMstX4dLu+1o1tNuRY2QN0VWm61EUrClSXFrbrJjMyK8YQLV0o9zxRB+ye5WK25nR+XNKhQG5
 +225XAp9k2jgDcfolf6xZSLonysC1UqpQERrsXYUE57KSY5rZyUtxlWc+ufHXKvjK4f6Se7dfPQ
 ZCMamKxqQK3HYo7yxQw5WI7DgO5+sYKMJY3w5DCDMP+ExFxrU3Gaf/jG5o4CiwSofAfCJ1CgIcM
 yrnxulJbIY4rt5IbaypVnWw098aXgoLP0aw+X3fMS2O2iIIhp0v2feKuQXxovW//2cd1SZo2tKP
 DjKqVr83qMJMuaCz7zGFQBUZDDCr+SVyEBk3oi8/BtsN+0gxRFv0MSOuZEG4PI3/+SAfBa2KM3s
 859AsN2tm6iYNSeW7qAnn2vIIZJShSHcYVywI9gZyBfCJhLsDHivG0ssv4G8zaRRw5q+5bwti3N
 64pZ7z5d+iewTrCykIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX/IZAgBjHBwhV
 l42B0TFvFwDRRp4jCMKP4ny/vwphWhao2RvFv1JEFznHJn2afEeG6sKwB/dceHJDQxXnv8cG9aK
 Zl/UNxf23+mvvFg3L98Tia7eITKyv+A=
X-Proofpoint-GUID: Ro8pCYiH7wRmxRP3ElRXcattd8IwT3HU
X-Authority-Analysis: v=2.4 cv=Mb/5KJ/f c=1 sm=1 tr=0 ts=6ab3336a cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8 a=5Kg8ZeroiQlN5m6z_VoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609230007

T24gV2VkLCBTZXAgMTYsIDIwMjYsIFNlbHZhcmFzdSBHYW5lc2FuIHdyb3RlOg0KPiBBZGQgdGhl
ICJzYW1zdW5nLHNucHMtZHdjMyIgY29tcGF0aWJsZSBzdHJpbmcgdG8gZHdjMy1nZW5lcmljLXBs
YXQgc28NCj4gdGhlIEV4eW5vczg4NTUgVVNCMyBEV0MzIGNvbnRyb2xsZXIgY2FuIHByb2JlIHRo
cm91Z2ggdGhlIGdlbmVyaWMgRFdDMw0KPiBwbGF0Zm9ybSBnbHVlLiBXaGlsZSBhdCBpdCwgYWxw
aGFiZXRpY2FsbHkgcmVvcmRlciB0aGUgZXhpc3RpbmcgZW50cmllcy4NCj4gDQo+IFRoZSAic2Ft
c3VuZyxzbnBzLWR3YzMiIHN0cmluZyBpcyB1c2VkIGFzIGEgZ2VuZXJpYyBmYWxsYmFjayB0byBz
dXBwb3J0DQo+IGFueSBFeHlub3MgU29DIHRoYXQgdXRpbGl6ZXMgYSBmbGF0dGVuZWQgbW9kZWwg
aW5zdGFudGlhdGlvbi4gVGhpcw0KPiBmYWxsYmFjayBhbGxvd3MgbXVsdGlwbGUgRXh5bm9zIFNv
Q3MgdG8gYmUgc3VwcG9ydGVkIGJ5IHRoZSBnZW5lcmljDQo+IHBsYXRmb3JtIGRyaXZlciBzaW1w
bHkgYnkgYWRkaW5nIHRoZSBmYWxsYmFjayBjb21wYXRpYmxlIHRvIHRoZWlyDQo+IHJlc3BlY3Rp
dmUgZGV2aWNlIHRyZWUgbm9kZXMuDQo+IA0KPiBDby1kZXZlbG9wZWQtYnk6IE11aGFtbWVkIEFs
aSA8bXVoYW1tZWQuYWxpQHNhbXN1bmcuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNdWhhbW1lZCBB
bGkgPG11aGFtbWVkLmFsaUBzYW1zdW5nLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2VsdmFyYXN1
IEdhbmVzYW4gPHNlbHZhcmFzdS5nQHNhbXN1bmcuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNi
L2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8IDUgKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdl
bmVyaWMtcGxhdC5jDQo+IGluZGV4IGNhNjlhYzBlYjA3Yy4uMTBjMTE0NjU2NGI3IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IEBAIC0yMzIsMTAgKzIzMiwxMSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNfZ2VuZXJpY19jb25maWcgZWljNzcwMF9kd2MzID0g
IHsNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNf
Z2VuZXJpY19vZl9tYXRjaFtdID0gew0KPiArCXsgLmNvbXBhdGlibGUgPSAiZXN3aW4sZWljNzcw
MC1kd2MzIiwgJmVpYzc3MDBfZHdjM30sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4
YS1kd2MzIiwgJmZzbF9sczEwMjhfZHdjM30sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJzYW1zdW5n
LHNucHMtZHdjMyIsIH0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1kd2MzIiwg
JnNwYWNlbWl0X2sxX2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtZHdj
MyIsIH0sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kd2MzIiwgJmZzbF9sczEw
MjhfZHdjM30sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJlc3dpbixlaWM3NzAwLWR3YzMiLCAmZWlj
NzcwMF9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEwMC1kd2MzIiwg
fSwNCj4gIAl7IC8qIHNlbnRpbmVsICovIH0NCj4gIH07DQo+IC0tIA0KPiAyLjE3LjENCj4gDQoN
CkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRo
YW5rcywNClRoaW5o
