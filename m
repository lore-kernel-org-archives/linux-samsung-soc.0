Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247B27B4FA;
	Thu, 16 Oct 2025 22:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653093; cv=fail; b=A/P5fAaGT11y3ehzd76H9zKdbFkSGS/3TziixFWIqJh7zocqqcEwnQmaSZCCRgTAzsrN5khjIguq3fcHz313aRnQAJdrZwfDHXN1ucxLiJGPZwzZwCmiJSU8PvZUsIK4ZhE3jeL1HSHuWx9t4RZ0A8TiklIxKb4GByt28+XO/FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653093; c=relaxed/simple;
	bh=LV/Kut2vm52wH7hIdyxC9pQ7+yN2EX3PhNpvkUK9PRM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nChonnITjFLe97j6T2eXqRxt584zCdAT4bNXQnUMuoKXzWWkbQdGJ+BpUgz70jp2kWIL31KMi8+JwxaXU2HU0uCqI9SzYOIi7ezxNXN6+qggLSApLjnwEzW5Clnmm9bB7kGUlPmH0rsypvhLiYv4eFbKYvd0aQ3aBSrvhrnhGx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qkhkQUlM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OvUW9xJX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZHjEXGh6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qkhkQUlM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OvUW9xJX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZHjEXGh6"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLmTK5002427;
	Thu, 16 Oct 2025 15:17:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=LV/Kut2vm52wH7hIdyxC9pQ7+yN2EX3PhNpvkUK9PRM=; b=
	qkhkQUlMAY3vfNikc57asEdyz4G+Sxsj4MrYqUKe25RSdnxsL7bv06wmqGrb2m+Q
	ZBvVkG604EEBdggGBuTP5XvIH2ACl9lS94xqwKZfFtGGCHsLQWUidXiOOJ4N+ZFy
	LfeaI5tZu0XUbPdzrFSt1761qsB3MZXOBDiwLxhai7MPXmgC/QqNZXPJn3HSPmiJ
	SRKrBpvEY1LK/WTZWInwOnZhp3oyM8AU4EJgquqIm7v4BgCgrP+wxWYuj34c8Qej
	FUV+7YR1bJEcfGV11Ymg1cF7yoLsJiuHEmmUgTVEtumvl0ylc2sR5W70UuBv24y2
	SJcUyhLnGoLp8wisrA7QAg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 49qp8jmca4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1760653057; bh=LV/Kut2vm52wH7hIdyxC9pQ7+yN2EX3PhNpvkUK9PRM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OvUW9xJXYRzzlKEsMUmTVf8Nb9WfSFhJCyMSXwZJ4SmbRAqyfNTE7OHe0RDapPkkQ
	 pGYXIOnxwbf5wubRpZ6wXNjDz9uG97f0eATq5gVlAPvgSngPo/3Cpq3kguA/TX1VGP
	 oc8unWBZ+hGwB2u95slKwkAtQT+NFfyRIoqWiMf8lIvhaR7tYCzzULHtwMvauHpTOz
	 8v8IxlPSBxDEf2671/ECf7KuD//4XtDu/wuz59PeGsFeepGkq6B3Vpf+JjgOM9Z7Tg
	 8GUoVn+cEq9wtIAU6+mHYrMfTpU2Rh7BOCKPMuXxkQl2V5dHoPQSU7I97yi9Vr1w4u
	 MFfscpqbiTAzA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB6B14045D;
	Thu, 16 Oct 2025 22:17:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 94F14A00BC;
	Thu, 16 Oct 2025 22:17:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZHjEXGh6;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00107.outbound.protection.outlook.com [40.93.20.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9045340AB5;
	Thu, 16 Oct 2025 22:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPai1A3SI7lBN65lZEk6K7ojQ8OTGD9ICAFDm2Kj0B824nMmFaMbf6ARo/2sLaGnzW/4AZIFPlXCYR2B2pXD3jENs4nZbeCcOhhwDJCQgdGstvKIsyGnu4h0sfKqLNDnQe4k7ZsKtoRSm9+guGA1/F2RJ3/9pGFxNxkAYKqnSZ3M+uN72eALZGKw+wAgbEMhp8kIF8RXyJOMIMHfE3vuC9dlCzKrIwuVGwI9fnPBkVnCLB986/X6pCqKNVy+eAr/l9Voz1ZgqJjbQpX7x/4VIywbNycMLN7P5ASwoJnFKZHFUnS9Pa1QWAnUeZb9vxXn4WVm4cVY9HEeZ1TZ9NkKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV/Kut2vm52wH7hIdyxC9pQ7+yN2EX3PhNpvkUK9PRM=;
 b=JLVujMizXwOtf0JdEQ152KVTDP3iBWO+JuPiJp5Qp3IQTSoUI1r4XHkxSoP/gSJvoFwZDyVA0+6IZ3wBlK7v8AgGtp6YXuSuGgk0x0rWS7K60CXWXnNwcZ9XRtvd68kZH27dI0r5M7xLHdqxhI+wZyRPP/rXWi3XLvUPYsUqBWQ1D+e2fGBf/JaSnQmlpSrB9koIFz3DyEn1ZID3771utgPXG4cY3xorW0c784DYuvDSDgmf37cS0PwadeJuqtT2hsf55/Lq4k7zpgDq54R0iO9JgMgfXUh4V5zQQpxragbgIErbY+UQg6iV0XYS6duq4eHPia0sr+xvPJ59h/HY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV/Kut2vm52wH7hIdyxC9pQ7+yN2EX3PhNpvkUK9PRM=;
 b=ZHjEXGh6PdYNbA6K4/Xg2NVo4u3A06KCNd92373037pU/IdY4cmunP6YD4tyfzZwaX4DmaOLwWe92vVo5IUz5Cp8fMkK0P6fXGl/zGDenJ22TeHvYi64fSQu7gjPHbXsoV+2s4Jsfi4w3PXwtBGyrWTrSjXJ867JIv3Woxh8l/A=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 22:17:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 22:17:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Joy Chakraborty <joychakr@google.com>,
        Naveen Kumar <mnkumar@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Topic: [PATCH v3 2/4] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Index: AQHcOiLF13k3PDlKBkq/J1HUJLefT7TCYMYAgAEgYYCAAd/ZgA==
Date: Thu, 16 Oct 2025 22:17:22 +0000
Message-ID: <20251016221719.fwropk5wnzm4lspq@synopsys.com>
References: <20251010201607.1190967-1-royluo@google.com>
 <20251010201607.1190967-3-royluo@google.com>
 <20251015002744.sntua4kqidgusafo@synopsys.com>
 <CA+zupgxbGjU_01JSFR_-2humZAyxwcVT5JR6h6mTVUT=3fFQ6Q@mail.gmail.com>
In-Reply-To:
 <CA+zupgxbGjU_01JSFR_-2humZAyxwcVT5JR6h6mTVUT=3fFQ6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV2PR12MB5966:EE_
x-ms-office365-filtering-correlation-id: 7675f498-0da9-4158-0a0e-08de0d01c78d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Nkl1K2VDRXFqemhRQkxxcHI0RGlrY1VSd3dVblcyNFd2QTJtWEgzRFJyNnpN?=
 =?utf-8?B?VmJjL0hKcnNwSnQ0YXpPS1ljdWNvL1pUWEJRYVg3U1NJTExqbmdnNHBmcDEx?=
 =?utf-8?B?WlloSkJvOUtGNVdyQlZlSTZlRHViQzBXaVZOR3FiQldRZytPa2N0dHRIbHVk?=
 =?utf-8?B?dDFST0t4VVQ5ZVJjNC82bGlCQVNPQUcrN25EWlVUelJkbmVvb0hxTG5RS2pp?=
 =?utf-8?B?L3hNaGkzVkNVVUlpREpSMlhxdlg0a21FeFhHQTl4VWRPMWNsdjA5UnVRYmhn?=
 =?utf-8?B?clR3VWhXbXY0Vkl0V2QwSHFqaTd4aTRHRCtCZU1jV0orZ2VCcE9lMmRYOUhI?=
 =?utf-8?B?S3JUN3REYTRxVTdzTmZzOHNUK21BMHV0YnlRcXdYWkpXb0ljZERRZnQvWjdK?=
 =?utf-8?B?VjRwRnN4MFIxMkQ3V1R6cnkwUU81N28zSEpoN0lnVVlHa3VjeExQRzJzNUZM?=
 =?utf-8?B?RkRNNWtqSDRFdndLeDduMUN6S3daTXM3SFlxZjlqOU5DTWV5cExKdWNjOFpV?=
 =?utf-8?B?K3hiYmhvMVdiT0RURzZKQzFwNXl2cVo4SFpYZHBDbm55dEJYWFFuTHZGK1ZI?=
 =?utf-8?B?VU5ja3RDa3h1V0MwcFlHNEhPZnNJZUtTVHV5OXhRaUFYVWtrQzVXUVFmbHB1?=
 =?utf-8?B?MUlrLzlaYWRWM2pHRzBmSFlQQW5lQjIyeVI4QzdsbXdoRjFJTm9WQjNRUjZq?=
 =?utf-8?B?OGhqbExLY3RDZXl6YWlTTHJQV3BLMmtGMTdYU1NNZm5zS3dWZTJnSXV6M3do?=
 =?utf-8?B?TE1oaTlZYzh4T3BhNUhhb1oraUhMSXFidGpKeVJoWDF0ZW5ndnFkcUdGQ1FM?=
 =?utf-8?B?RGYrdWR4cnJBT0ZTY28yNU9iNFRpYVBBbS9FcmVDRVhqNzEyei9BSGVNTzFK?=
 =?utf-8?B?a0RINFhLMXkyQ1lxSG1NNUtYeFNoK01mZlhJUWlzOFhLZ1lRYXZjL0dKZ1VB?=
 =?utf-8?B?ZUdwcUVPOFdGcU5kSUNKMDE0WC8vOTZBZ0xiS2VrSk5xOTEzSzExQmlYM2JI?=
 =?utf-8?B?eG9CRHpDTU9KejZxMUJ0QTdtNUdxQk5wTXNUZU5kMXg0RnowT0c3MVhlQnls?=
 =?utf-8?B?TVRaOEhoUko1bGJBR0xSd1hNUkNCdWZDaktSMWk0ckMxaWZDdjM3RmVQdEk1?=
 =?utf-8?B?bzZiVGczT2pYSzFTZ1hxdTl4eWdPOEcvcUlqb2lwcVM3cmwwYStNOERaZFg1?=
 =?utf-8?B?aHFnUjZUSFpUQ3ljWDNHdEYyRHgzd3pGVGFxRThkd1Y0Q2hXTG16VmRzZzUz?=
 =?utf-8?B?V1E2QjIrQkRiNkkyblV4MXhWQnBtVSsxS2h6TFl1dUR3Yi9rblhHZERvOVNX?=
 =?utf-8?B?MWYzelRRQzVBVHd2UThFWXFTWmlJNXV1R0o5N0dwQTRYeGhpczlRcGNMK3pw?=
 =?utf-8?B?bXZUTmhnM3FNQmk3V0lvZnd6NTZpZmh1YWIrVUkraXFLa1hoM2dRV09wTnNZ?=
 =?utf-8?B?Q2J6L1Z4THZkZFdYZTEyN1NUZSt6ZjMyWnEzYU5OSE9uRGhLNFBpZ211bFQ2?=
 =?utf-8?B?RTJhYXhpVGNoTWpaN1NtT1FPYWlrZVZtQTE0RWpjUFRoRnI2R2QvdEFXa3kv?=
 =?utf-8?B?dVJmbnFaWmRONUFCdjE4eTkwcTF3cmRZOXpIUGtGMUlmYXR3bnpYMnBLNkpY?=
 =?utf-8?B?ZW81Tk5BRGtIeG1jMGFaaUoxQys4YVdDYTkzSmVqbWJlb2xHYmx3TmxteU9G?=
 =?utf-8?B?cnB5eEppeEsxTHVyWXUvK0ZZeUhPNHVuT0Q4eWI1cmFsU0N5TGk0UklobGk0?=
 =?utf-8?B?bW54OGMxVFRqQVVzdWVXU01wZEVkWk5JRGJOZmNjcC9tMnNqblZyRHYyekZD?=
 =?utf-8?B?Z3ZEZXJnNVVuTVl6T3hRTjhzYTMrSkpuUnRXOFJWaGpkOGYzbVJ1Y0ZSTVdL?=
 =?utf-8?B?WFpRK3R4eE44WlY2N2d1clFsdThUL1BnUW9qWXVkTTNoMitUMXRmOXVXQk1J?=
 =?utf-8?B?ay9jaWxSQ0xNR3dpWUxFTTJpSEd3UTh6NUVnS3BiRjhsWTRQY1B3dlJSeTFa?=
 =?utf-8?B?ZjU1dEhDV283UnFKMnhxVDI3RTE3S1VKUXNkTWZCQlpaemNadUtscU1nRW9I?=
 =?utf-8?Q?giz6pd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXBtZGYzRmNoOEh4dDdFN3VCNnp4RkVZQ0IwV05wak0xVUJJclgyL0hjdVFl?=
 =?utf-8?B?OTVMT1k4eEo1NTBQQUtRdUlwSFhLWldSY3RYLzM4Nlc5amorRnRjcndGOXR6?=
 =?utf-8?B?ek51dlZWL0s3OVdwUFRQN1pwUHFPRDROaHI1OVZidG54NlFBbVlMVEpCMS91?=
 =?utf-8?B?cXhOeUlIaWwyNWtBdnd6YnNPSEMwZGNDUnFEbXJzN0JJeHV4VDRLK3A2UnN5?=
 =?utf-8?B?Vk5wMnhpRDdYTE9VNUh2S3hoRU5SbWtWaWg5c2FNZU96cWk0c2k3YlBNTjFR?=
 =?utf-8?B?RStBcUtWT20xZllQVzcxNkhvV3NFL3o4N3NNaEk3RERzTGN5R1d6L0pVMGtq?=
 =?utf-8?B?LzR5dkNGOTA0cEZnUDRnOHh6eVRmbGRLL2tuWnA1NkpybGZvOFFoSHdjK1hW?=
 =?utf-8?B?TTVuUjRMTHh0WCtHSEFGemJVOWhDZitySFg0eG1SdnhkZzhJSnhDeERva2dQ?=
 =?utf-8?B?REU0SzZwdzJxYzNMVzNibXR0VnUrVTd3K2dQclQ4dnc5OWZ3UFdGTTNjWDA1?=
 =?utf-8?B?Umg2RnJUTkVpUHliV3V0bFlTUm5IL0JZN3psY2pCVlRGbDdpcTFJYUVJaUw5?=
 =?utf-8?B?NlF5SlhmRCtOMTYvSnpZTEpqUWRIUmpnZUtSU1lXZldkOS9kMmh3aXFxeGdK?=
 =?utf-8?B?Z3hUeEpuZkNIN2xJeTRSSUpCQTFJaXR3MG5IZXJJQ0tvWS9VVHdwYjF5aUN2?=
 =?utf-8?B?N3Q0MDBGSHhMNFlGSzJTMkpsUU9FcWtGb2l6SE9vZVNLdlVhRDE2WmFBZER4?=
 =?utf-8?B?bjRZVHZyQUVVQUFTT0o4anYzMDRZNVB3dXkzd0NrUGpiUVEwUUJXSHg5eEpQ?=
 =?utf-8?B?MGV6bG80b0gvelVlQnpkQ1NjMkNPYWNOS05xOHpVMTc5RWhZSjlTTkl3LzEr?=
 =?utf-8?B?Vm9hbUpPeEhPcXVuanN4YkZRYnk4clNmSGx1cFdNWGdxMjFpRnZLdEg3SDVy?=
 =?utf-8?B?YnV5UFprU0JXME1UTmsxLzhrVTNUcnZVR3FOVDd6d2JKK0pOekZjL09LaE1H?=
 =?utf-8?B?ZTQ3SHNOQjIwMXBjNC9HMnl1emlnVXBSK3IxelBvSHhRMjNqWjdEd25TSWhn?=
 =?utf-8?B?ck4wVmZRcjAvNzJRR05aZ3oxQ0JCVHExZC8rQUlxV3BBR1M3UmZZcCtuU29F?=
 =?utf-8?B?K1loa243VTVEOWRKMlZZcU93d1lXdEptcFpsc0J0QUw1VGk0dnRLWXd5aHds?=
 =?utf-8?B?M1BVZDBJSHRPcFQzQnF0aHRzUlVDSlFzcHdyVitxSGZGQ05UaVZMSWJpdlF5?=
 =?utf-8?B?NUJ0RmNJTlorMHdEbFplbXBsZCtLcGppWmJrcnMvQTR2ZEl4dHFJUTJ6Y3dP?=
 =?utf-8?B?aDloQ3E1SGp4emZFN3FzUytVMXkrVjRaOG93WU1RYTA3SlhYMmVaZEM1R3FM?=
 =?utf-8?B?K05HUnFOUU9kMUlLWktQQmQ5aFdXK01NZGxpeDdpNU92K1FyOWZuQW1XSFRM?=
 =?utf-8?B?eERBSC9zWTA4YnFOdkxhc2hIN2lPcWJuVWRjWXRCclI0Yzd5NDYvU3FWbERU?=
 =?utf-8?B?czJGMGRiSENPUnVUdFdTVUhvTmVUanhVTnhJRXcyVktPclN3NlZvTWs1S2ty?=
 =?utf-8?B?dXpvTDZvcFF3UGFPRDM3cHpVYUNEYWYyZ1ZrNDlpRmoyQ29HYWJiaWx3MGZk?=
 =?utf-8?B?aTQzaE44V2x5UDNNMlc5dkJ2bGhlSWhiRnpvUDBFdkk4N3dTbTJXKzRTVHYz?=
 =?utf-8?B?eW4xbW1xUTUzTmVLSlRpa3l4THZIeFlDSUswVSt3MkoxS1NXMzQ5MXpjRGJ2?=
 =?utf-8?B?TDdGci9oZ1Zaa2kvOEpScjVmd25mSnJsMER1UDE3bDlJbWh4ZUlCblltV1Fr?=
 =?utf-8?B?SThObXFKR21CNVJpNzZKZWVWeTFWelRCMDY0OW5XeE1sMHQ5SFJwSER2WXJ0?=
 =?utf-8?B?TW1VUGRZaHptNFRCeDl2UFV5N3ZWMmtrWVFqS2crV0F1eGRZT2VXMzZxdmVs?=
 =?utf-8?B?TE5obHZOaGlTZ3FPWGo0Qngwem82dHV6R1VKMmUrR1Iwb3hXb095djZzeHBK?=
 =?utf-8?B?aTFIZm1BbG5yTko0Q0thTGVINFU0a1hxbzdmZWVzMm1ISFpGcEFjMml1L3Jr?=
 =?utf-8?B?eGMwcDRaVW5TVlRsL0ZUeFZrWE9leGFNNmV1RlUrOG5PTDJMeDdTc3Zacmcx?=
 =?utf-8?Q?NkGMxxwbUqGlRVAcq2lVZJP2m?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D031644A3FAF245880BCD05D126BF1E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3jR8YASG5Me7IXvgxFKD3bLEWcTj8eRx58zGCYn3t9Yk0o5wbU/AADFmOFs5DtqymViq9hOLrAE6GI+UQHqNy1SUd4NFRZFJlfaQScvGyha5I+8cIRH8qi7Z92CRznlF3u9MZAxnLd2IxHLr1FeKxG5nXB4z/mri1yoUg0ieQedQ1ePuz1fxTBrmvxzNrf2TlHbQFz7LWh9b2cRkRD9ECkYdna3DAgMZ5JeY519gi+qdsiDRFMiPw2akUhXHspoYX+PGZ6TEU8OB/CQI4xEA4ivfOjFB+fCFm84Ys4/M0w9wnuYvigdglTwIq6otHzGV9mf88ag4bId6Tl7A5rvBYwavIqjNBBd1r+nX5v5vaFvgieumLeQ2kpM45mJlQTJSR3N5Sfz62/KD6vx+qvY7AQysEspfmk1AZ4vWhn6bl0AoQgxr/3O/3wDV325ysAqjtUuaF1aiJ0ohWe3FOOIFG2jTox+f7qVAH3EhoyCnEl9YpcXpCEFgKpCISyf50usyqoKe8If79o4yPYrpgkZZjgyif8tIHlGRz2TEDwY+kOAB2GLJrMWc+UTyIYHkdIIQkplKa3alUsAgDRNsT7Yuea2++y7ar6Zq8bc+be9FmFcxwcaIaXVAqisLjNH83RHCYOTYRno+VEQ2kkelkDtWXw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7675f498-0da9-4158-0a0e-08de0d01c78d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 22:17:22.6655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMLDQR5X97wvq9qTzUY2NA6KKV3ArSx6S4qPmBBmfjSTEsQGGQxsvO4OC9qpOeN0zTNj7LwwNqGuR47ZNmrtew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966
X-Authority-Analysis: v=2.4 cv=BN++bVQG c=1 sm=1 tr=0 ts=68f16f01 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=szCttjrYUY92rff2lM0A:9
 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDA2MiBTYWx0ZWRfXychBk539V7HI
 3zZ2xSx54XRh3frl9rGQ4U8DLm+Ua40Z+X512rvba2HYIQ/MoV9POQMRkgWmhFB06xK3lYIP/LK
 saaBBwCziB5vQOIulHtMtj7F3VyKr4JnuzvaW7cOhrv9yr/d631FMpUnJmir7cv7DgMcV2IwwZb
 x9BDzHfAC254vs5anWeKpShRPEPCQZ+dSasoGoKMlNJr+DLjrRnPKb1eZfCoPV+uk3EQyPaBdYj
 OxYqNC6Fdo8Snsn8CrxaFu4M3kPLMqk0ZS7OES/VS52Gvm0mYAMVqXP0zbqDwfwzJaxaPY0S2ac
 X9ookk7wilsnTccAorfH0PVv3msaYius8HNvMLoQBe4y8sPK2v1OpcUgpiKJ7oqRABbFQwkIFSj
 sjZxmU2dCZHRdRAW8jIgy0dlYGRGqQ==
X-Proofpoint-ORIG-GUID: QwkFXVj62a4JES-DnQZhxEOaMgU4y5m-
X-Proofpoint-GUID: QwkFXVj62a4JES-DnQZhxEOaMgU4y5m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510110062

T24gV2VkLCBPY3QgMTUsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IE9uIFR1ZSwgT2N0IDE0LCAy
MDI1IGF0IDU6MjjigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gR2l2ZSBtZSBzb21lIHRpbWUsIGFuZCBJJ2xsIHJldmlldyB0aGUg
cmVzdCBvZiB0aGlzIHBhdGNoLg0KPiANCj4gVGhhbmtzIFRoaW5oISBhbmQgYSBoZWFkcyB1cCwg
SSdtIHNwbGl0dGluZyB0aGlzIHBhdHNldCBpbnRvDQo+IHR3byBzZXBhcmF0ZSBzZXJpZXMgYXMg
S3J6eXN6dG9mIHN1Z2dlc3RlZDsgb25lIGZvciB0aGUNCj4gY29udHJvbGxlciBhbmQgb25lIGZv
ciB0aGUgcGh5LCBzbyB0aGUgc2VyaWVzIHRpdGxlIG1pZ2h0DQo+IGNoYW5nZSBpbiB0aGUgbmV4
dCB2ZXJzaW9uLg0KPiANCg0KT2suIEknbGwgcmV2aWV3IHRoZW0gYWZ0ZXIgeW91IHB1c2ggb3V0
IHRoZSBuZXcgY2hhbmdlcy4NCg0KQlIsDQpUaGluaA==
