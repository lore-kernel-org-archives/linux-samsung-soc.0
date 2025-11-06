Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4016DC28;
	Thu,  6 Nov 2025 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762389573; cv=fail; b=QWBS+RAUQ6Ey/rtYsclg0E6aJPUiCi4ZeCiV/RyNNdDzXymdqjKg5cEus9nv4sP7EIyeHd0Dh32Cf6ZT8VXpyCulFVY+tOAKNZlyO3iI/SnnheSkNUQ3zJGCICIMdWdrUIy+oJdyvRejwcKmnjejRxiaQ9xXEym2rJ2mGGHmpK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762389573; c=relaxed/simple;
	bh=Ek/3zcbIyvEkt4zLGwMmPu8SWECaIaekMq4vWqlUZEA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HEKMaxNDSzGOfRnjCQw9NARYP7q19ih28+ReEohoUG4vSI+3cM0UptxyJPsSUr6YASAGyLCtvdyY/Hjk6tNhjdyJ+2SHRP97HXMTvKfbqG7RxkCSefgJsIPejmfUdFPIKg020IiswIZ9lu03hiK/FcLGMVkcBUJwNEHYbtwhX10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=c+KqBMXY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VTm1BZ9T; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JWo4oYGm reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c+KqBMXY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VTm1BZ9T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JWo4oYGm"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5ISrcj1721125;
	Wed, 5 Nov 2025 16:38:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Ek/3zcbIyvEkt4zLGwMmPu8SWECaIaekMq4vWqlUZEA=; b=
	c+KqBMXYoJN74Nmrb5n0os9ZMqd5CExyT7jpv4NS+TkjiudvFtIJr+CIz0J9j5e8
	7S18U/YvidSDyNtELRTRFIb1jBR8d1uDzaXkc22pbC+vCVRfDVfud7e6/zDh/wls
	DxoP3jEqdJd36B150iLomTRSOh54/gMlOQYPi1tprG5W/xiEiSbzvHFm2iIskfoG
	c5bA0OwpiQRo+wbk334GVjDFW2rs1MRcnQclwFTrPIH08apKdleTnYDkFpxMwNjp
	+CJrvjopYfkvMlZkx0mSJqwB8iqZ/2XNfe+T/8MSL6JQcNU1C4TWcCPlKrI5OpWh
	DdqH6KJqDl8ElIxz3zHQ0w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a8bw7sngs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 16:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1762389535; bh=Ek/3zcbIyvEkt4zLGwMmPu8SWECaIaekMq4vWqlUZEA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VTm1BZ9TiaAaZNMlJQ9gYjeGl8EiV07GjiLwIwwtRcO7jPN42gU5SEvChPmPMui8+
	 LxgfItYYAQyL3eLgWhwfSoST0GzAzxdjMQIj2su/Jwmp8J/nQsRbfetIhT+YEEFghn
	 BJIbhF6qiTqLFh3ew6eqa3IM9wJwPQfL2fvgCrMHcKAlhmPVUagDzbUQVsVOxVDP45
	 U5WfImSYf93NUWzebNRu9dnT6PlnBeNOEauZ+NBZgxvyPitesRc1/+HDsc4skMYI5B
	 dHpt+nM3OS9Qa4HLAWZtLqwhivAt+5rFTJ0oT8SQag9RMlryijVIMosss98GZlZhdK
	 ZMILjrzbrM3Sw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 31C8D40226;
	Thu,  6 Nov 2025 00:38:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B9AA5A0070;
	Thu,  6 Nov 2025 00:38:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JWo4oYGm;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00107.outbound.protection.outlook.com [40.93.4.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6FD9140566;
	Thu,  6 Nov 2025 00:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwTnQzA/nM+B34aqsKHt+R773zU+H6X0+3QoFBk5brSxGGtiedil0CFRq1ADm6fWeMKisRuOWalttSUJjkCmMN1yaP/vGAa9b0PdH1eJPhBiVxAWb+2KqlAmnbn2+jazH6biRXxB3ZKheWD5SDZGwTqUgcj4Bkaooo4L6xNrA2kKBBgjHLyidAH/elp35e60TYqBICtGxZBo1cKucUSmzo+nbXgdyUsPxK+L4GEeFZvX/5Y6zmIodSp78K68VP8LMVN2Ppy8mxwaYm8iBslOXdNOQSbANAOh4yuhKu3gM/s2gc18WvRXXSb+izGvaLqb3wZgNQywZgy1QoUM3WTWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek/3zcbIyvEkt4zLGwMmPu8SWECaIaekMq4vWqlUZEA=;
 b=CrNguY26uRp2c9X19mlyJMk7E8aKJX3IT4DM8WzwzvFMKUcZysJxmDpy9bxmLM35r+JrTT/DoI6pP82Aa4klubTjKEdJZ455OT9t8CERljk2GyFoozFitAUcbf7bpU/1ynaqNvdJETdgiJefb8jA9pbFK8Bxgsc1YdZyQV3haJlp5s6sXcK6lmsCH0yA1v7mQqBb30NvHCjRMzDy25/MKS2aoAqiFSSS1tzB6v5TBsMwLlZwbGE0T8unTJ7lHawZgblVOsBFjIKYSBV05PJ150I5JHyv17J2Is3VAWlbYpaj6j8bSD1e2LfOZwhPDSXGGPVp3y4rbfSXM3jwrWmeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek/3zcbIyvEkt4zLGwMmPu8SWECaIaekMq4vWqlUZEA=;
 b=JWo4oYGm2QwPLdjPZb3oLacmXsA54NF+VRfy0yWzJMqurHy7NbPsHHbpN9F4ONHnH35HY+LdPBRzY1SvPPEH20Z5kh4V0lQADT+iNiODwhfr7XJbbLa1vmzn+xa6m4wi+jabU0HSPjLDZV2iyx74O4CA9K8S0UlyEQ/RIGpYnz4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH1PR12MB9672.namprd12.prod.outlook.com (2603:10b6:610:2b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 00:38:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 00:38:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Topic: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Index: AQHcP765hkb6mxiuSEGHvmS6Dp7Tg7TZ+2SAgAMX3wCABMy3gIAAk7cAgAJ4KgA=
Date: Thu, 6 Nov 2025 00:38:45 +0000
Message-ID: <20251106003830.v22dnomurtqmqc2y@synopsys.com>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com>
 <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com>
 <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
In-Reply-To:
 <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH1PR12MB9672:EE_
x-ms-office365-filtering-correlation-id: 3fb30aaf-a352-4966-dd55-08de1cccd7d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZHpqQ1lCMDAveDFzNFJHZ3FqREIzczI4N0JJclJyemwrZ082M1ZHS21XZVlD?=
 =?utf-8?B?dFVpWVJ5aFc0YkdPQ1NoUzJVckl2TE1xSkFNUm90VmRrUlkvSTlXSFc1WHZw?=
 =?utf-8?B?RWRJcWJQMmV3SEJoQ3RMMXBlVk5uakV6MGp3RjdRQVZHNjN5bnpoVnVXWFVC?=
 =?utf-8?B?V3kyMXFycWIzTGYwODV1Z1ZWOXgvTWVla2lpVmRhOEx2ZUZFZHk0aHQ2SUZB?=
 =?utf-8?B?aWhXdUdmcW1uK000MmJGblNzUE9WNUtUSzZoTGFjQkJQZUhtdnppZDE0dUpY?=
 =?utf-8?B?UnZjRk5GS1hXN0dTMk5VNkVtbEQ2aUgrcGNpKzFXUEhxUmJCNitpYU03TEJQ?=
 =?utf-8?B?d0NxaXE5NUhVaXdMVGdpV1JDaE92TlgvbWUxOXZhN0o2d2hUNEhEYzhhS2JC?=
 =?utf-8?B?cElHQ3V6WHVDWTMvSTJCakV1SENWSVE4OFBRYmlXaU02dUlqK1N0TkZ5R3Nm?=
 =?utf-8?B?djBvVUNQNEhCYXpwTEthV2o1MjdjL2xzZlgzVmtQQndGVndReWNLMDMra2FJ?=
 =?utf-8?B?WExZN25zTWllaXM4NUtFeDNWYUxQRjR3RUxPMGN2SjVvUlZQR21UTnJXZjZt?=
 =?utf-8?B?N1U1Zjg5aDkwMEhZYlVKcDRmaVpQQkF0dDNIMW01NUxCcGdpRmlsWDhlRHor?=
 =?utf-8?B?ZWdOTmxzY3dNMXBBMmN0dkVoRFQ4bU0wU2h0b2VwM1FGb3VsZVlLUWNOYTZ2?=
 =?utf-8?B?L21FZjA4cVJiREM3cjFROVk1RU9BWENZVTM2OFZta3FlNGFUdkdQVFVzSkVs?=
 =?utf-8?B?VFZMd0taWElWY1Nhclg0M3c1OGdvd2dGKzQvWEpvdEk2WUNJUjRYZkppeUZa?=
 =?utf-8?B?dEtpVnVFM3FIWWE3VklWcUhNVHlBYzRQcjNaVWFRbVMzQ2JWR1ZqeGgxcm1V?=
 =?utf-8?B?WjVaRnI0SEJKNkNxb0NSS2dsS01ObFoyN2g3eHU2SlNEUEJ6K1RYRFArRCtP?=
 =?utf-8?B?T3RMWCtWSGdUbTBtTnFNZmJobHBNbGZwZ2hDaStha1ZFYXVyN0tHcUN5eEVv?=
 =?utf-8?B?TU1RMXo4Y05taVBlS0p3OE5zNWt2RzNqcUF1RFJnd2xsS2NSR0t1VjJPNzJH?=
 =?utf-8?B?TVFIVlhKUklwaGJ2TUhwVXh6cExiSXRWaXhtbExTVkRUNVVibzcybGluUWpW?=
 =?utf-8?B?eUQva0dVd3BUSFdnRU9sQVRmMDMzSVRIclczTEcyYisvVGlMQ0tlYmVqL1Uz?=
 =?utf-8?B?UmRYWllRNUlvd1p6ZVJ1a2xYbUd4WkhTMzYrOG9YWUh3NGdrOThxNTNqUFg4?=
 =?utf-8?B?VkV2WER5TEJUNlFzeFh1VCt6KzNCbnFVQ2Y5UW95UHN0NWJuWjczMUc1Sjlp?=
 =?utf-8?B?U3dRb1pRWnFVa1kyUmtCOWNYanN2TGNzY0ZsYTQrd0c0RHVyam9oNzIwdFdT?=
 =?utf-8?B?aWg5T1E4ZCtFa05TNzcvTkI0MzU1RVhXeUx6TWpIWE0yOWNEKzRNL3JmY1Uw?=
 =?utf-8?B?WGJVQXhKdktPa1dvaW1SbFNkV21COVJiTER2Ylc2TElPYXVZeWY5M2gvUHlF?=
 =?utf-8?B?SENabGMrOXRDek8rdEZlaHhJWXA2QkFSOElFeExaVy9vN0Z2OTdhTnBsa04w?=
 =?utf-8?B?WVI2R3pjd3BYQ3g1TDBKRTZ1dTZPeEd1bGlUMHd4L2dkVGRveTZKcjdoUnRp?=
 =?utf-8?B?T1BzaGJhUzRMcldoOExrcUd0YytkcUdXU3ZVTitmaXVobG9kWWdoMVJTV1VU?=
 =?utf-8?B?ZHNzbW40VHpmU2cyTDA3ZFdFQ3BJTm1SY0RpUUhsVmV1WUVFQk1pd2hVKzBo?=
 =?utf-8?B?bng4cEdsdjZSa3EvOGNZT1hzMHpJVy8zanVpMThDUys2YVloQUtBQTlTbWRP?=
 =?utf-8?B?UWtScExSVURsVngyUHR2VWZEZFdPNmJ2eWxBeFREK2VKY1JtbEM2bG1WZ2NP?=
 =?utf-8?B?L2kvcU0wbGxXUUNvdjNLMWw2UFhMVFpkUFF6QWpGT0l6Y2M2UzJZcCs2YUFS?=
 =?utf-8?B?S3U4TFdDQjcwTG84ZytXUVVPSlFzMW9LSHVPcDl2SzNJMkRpNEJOc0xjYnFq?=
 =?utf-8?B?ekc0Ynh5dUFaeVdaMjFqUVpHekkyWTdBTGt4bDBwbHZjMEwvUzlaSFJaYWZN?=
 =?utf-8?Q?XpcDt0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHkremx3cGltb0w1OXV5aGZSZUNwTGF2YzFyNSsyMUZrdy9WNGFBM25iOUp4?=
 =?utf-8?B?b050ZFBlWkt6WFBBTFF6UXJZTUFtc0o0bFUxZlBHeksxRFVwbjFiOGJpZS9J?=
 =?utf-8?B?dVlhc0FNY2FPOFdRb1c0SUlWSG8rUGFvUEdodkRKckhZb296emNjYzduSjlU?=
 =?utf-8?B?Z1p1S2VBYWRQTXcrdnF0Y00xYUpPTUdOTXNLTHNpcGhQc0tZOU43RDQ3ek1E?=
 =?utf-8?B?SnVJRmVvRnVNSFpiZ3FWK3ZlenBTUWhLZitWN3NPbXJOM3BETFhKNTVkS0Rm?=
 =?utf-8?B?a1h5WSs1STRTeEhQNHpXdU9uMTVKcG9WOHI4eG9ycWpMUUd0T094U3RaajFK?=
 =?utf-8?B?ckV2ZUw2azJ4c0VEUUtSbm80V254cTJzUXdxSXlwalZEMmdGVTliR0pISjJ4?=
 =?utf-8?B?Mk9xKzlJbjdObTlxWVNPZjE3V3YxYVFuM3hVWFlkQnd0VVpyL3M4NzFlR1hE?=
 =?utf-8?B?cnhNSjlsZ0VnZXZJRHFjZ1hsT0xGdXVlNXlSdTVQbHp6ak56eVk3aDlSM1Yz?=
 =?utf-8?B?a09qMjREUEVEalRqdk01bVphTlVIMzh5anU1bVM3Rm9hYXdHQzc1aklnTXkx?=
 =?utf-8?B?VVowdFNCd1l5cjJPV25GK0JLTEozRC91bVFVcTZuR3hmdXg0aHhQd1JrSkkr?=
 =?utf-8?B?ZGlrc2tzcmR0WHFBUkFjaVpUSUlzL0VkK1I3WmdpTlNob3h0VEsyQ2ZpQzlh?=
 =?utf-8?B?V2VCN3pLeCtuR2NUb2QwbVM2TXRkOWhjYmpqeTUzV05NN0lVWlVEMVFEaE8r?=
 =?utf-8?B?TG50aTQyanQ1ZHdFdGs0ZEN1WDNjYTdEZWt0eEovbnFpNGI0ZjQvK292NWpF?=
 =?utf-8?B?UmVWbVZkMGJ6K3dMaHJ1bUJOR2YvQ1VXdWZZTnhxanV6REs4QVBGTXJmTFQ0?=
 =?utf-8?B?SGFTMWoxQlFQNHhiSEhEcVp2ZGFnakVSMDhIVFEwaXNPNUhDNGdIYWdaemtU?=
 =?utf-8?B?czcrVk5iRFNobk5ZMGJxZ2QzdmRVVlAvTVJISFcvU1VZdWlnZ3RkMkpqeFRY?=
 =?utf-8?B?WWQyK0lrVzJsVk45b3I0YUNzaklNSHI1aUdMcTR4eWpDR0Q2dVFjUXovWWRN?=
 =?utf-8?B?cys3THg5aVFINkh6VXFGTWx2RktnZ3JlbVZFMmF4RWd3SCtIVlhkMVQzNHk1?=
 =?utf-8?B?NlBNT3lMRDhMV2dWOE1FY3JZaGpWK1dkazB4QjhrZ1JYZDlGUHlkRFZnVUQw?=
 =?utf-8?B?SjkzcEhvbW42RFg4bS9tYi9SQXlVdGZjYU9VRXovNlhHT2dKSm95VjdBemJZ?=
 =?utf-8?B?aGN1WjN1QytWNGw0c3RoY1JMTTROT0F5b3VvbmJkYjg5TThmYU1jRUZqdUow?=
 =?utf-8?B?dExHZGM0UTcyT2piU3RXTHBHTElDbjR2QWJMOWtNYkV6NkdnWFBCY3YwZFZG?=
 =?utf-8?B?dVRJUCs2VlNvY3FzNGlSYzBaaVNHSzEvWk85VVNJaWhCNG96OXY2NG52MW56?=
 =?utf-8?B?OC9IOWp0ZXFnck5CQUVwdFY1VzdlOWZOQkdZQ2Z0NFB6MWlkSm9HYkppK0lS?=
 =?utf-8?B?YmNNRTZiMVIzSWt2QjdCRTJ0SVJaMkFjRWlrOVEvMUlJejJ0SjQyMERLazVZ?=
 =?utf-8?B?dzJlMUNjelJKRjFPWHBKbGZjODlOczZMTmxsclNSMUx6RHZUUmFkWE1PNHg1?=
 =?utf-8?B?bi9tM0g3MGRBaGViaGUzei9iZVRoWUxGNHBYdzBKQVV0ZG9GN2xuODVWSThk?=
 =?utf-8?B?UWN4MFNnaXBxRTc5NjhYZGNzaXRVTTBmR0t5aUhONUo0ZlBlakp5Z1pMRFh6?=
 =?utf-8?B?SzRoajRBZUkzb1hpQTdtVlNrdmtQc0JQUnpzbTc2UDVSUUtpT1RKYVRZOHpo?=
 =?utf-8?B?WTJadytwMzIzOWloVkwvcjBVTUgvUk5iK2NPZE5FZWdGQ0srNXVja2dpUVNR?=
 =?utf-8?B?V0t2VE1TWXRsRjdmL3dJUEF5MVZUSXp0R2NkQmVsSkszbXJ4U2RlWmUzMDIw?=
 =?utf-8?B?UUtaNlVSMFlrdk5neVhybTd2MnpWRFBqbVRZV1Y2UHF6WGZDbmx0Rk11c1V3?=
 =?utf-8?B?ekY5eGVkMVczdGk5Nnpwek5rOVozYUQ1L0haSnhwZ01uTFI0ajV4akhEQXdv?=
 =?utf-8?B?aUc3SjhjUUp0VGFUOVJzK2NkQTJMR0hIQ0UzSkM2MStIeWdCU2UvSkd0OVdJ?=
 =?utf-8?Q?O39F0yyBYNFlHSMQ9HH5O+D86?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A30DF21D8244C49BE4F15C8481052B5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4cuanh2NFR1o/Qpyc+tjPizROzgdWrW1LkVcF6+0/Q7USSqYJ40N0x9VJiv/rEH68O4xnE1KAv9GGOerqouxSHK8/Rp4Sft3FoB0kHt+W9uedsLgPfEK6jn7L8NPbofO0pCtgrPbPPH8ZKz72aELOAoUmpLR7O7x9GK4kdTdeyF+o6+UxR//YpgFDxkhBUitwU/v/+hsdnhxDRPh4kepcL06QpRjirTWxMccuYmEXGi2IqsvOLl+of4G36F5b1TA9Rdg/wpl5SpaawvFkacRkeuQ5ECi5FQ0vDUVOsE4KunjcoY6ydJAwCk3AnhdgIEqChA96BBaMnctru4kGp4ZjXdYcsbGXHtwyAOzuigAASZClb8HmwyPGERlUs2wr/KFIMID5N7O6k3WRu/6wPet58zbhCJHKiC6o61RwCUndU6jpy5F7pbdmrHyBab7as/BfKDVnqv36twpWsxM8bVowzQ/p5LH6M6+Vdt666rI+vMUVzjW2bEySKY5ToxjcCNQNGc24bLD3upe32k/kB9oTm7IACAJw+cbQkg0y0WRAXJikjBqN8nQjk7nUSSsyh1Oqc/fyZlkNtIs9mwXE+0g9abl+zbnZE6Qfetq5V/UilRTFdn7kMOH/mCKGwypqpe+fy2AM8EuML00BRGXvWmjOg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb30aaf-a352-4966-dd55-08de1cccd7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 00:38:45.3068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dd2mdQukbuo+N1ZjpPapQ53mDCY77BZ4c6QOgAHNP50KfC3UZgdzlJCulXqHnwk3CVxwsREMUKRM2zDvgFXIDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9672
X-Proofpoint-ORIG-GUID: hix9kWri5BQyBhcFrmCSbfEyIDiao1V6
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=690bee1f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=NLfWqXYr1lRW0MI59cEA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAwMyBTYWx0ZWRfX4LKdOQheLkUF
 MQ23rKTORJlY94//HM6YUJRezeiLCjJGSMxjZFITdyHW23bpvZg88V9Fb2i4IqzorZlUM4D5AfE
 nOE9bf7vvYcD+luuU5g3L9qP0jUiqw6iMstFSiyBz2KIp/7BQ3trtkDxqSWRMVDlPfC9jMdGLN5
 feNDWWFgkxwaAmvKTzQcZT1K/y4VGg4U84n6/H9cQAOe0z/D9yZzNczR7MkLodV2d/o/0NdYfIF
 L8hj/KC7X2tOHEVdHLhiYaTwuA/ku3xVoU4n8rhLBWeN/Q+0mnZTN1QKEm4QcDuUTk7cjlLKsPt
 6kcwk/ADXdu1ryckW117AuFPf/0hCfJziVuryMsWEQZtiRCqsLhMABYMY16Zui7zNszl9HfwoLg
 FNPA69oWiXtZhPEmEuroziavqRr/0g==
X-Proofpoint-GUID: hix9kWri5BQyBhcFrmCSbfEyIDiao1V6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511060003

T24gVHVlLCBOb3YgMDQsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IE9uIFR1ZSwgTm92IDQsIDIw
MjUgYXQgMTA6MDfigK9BTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCBPY3QgMzEsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+
ID4gPiBPbiBXZWQsIE9jdCAyOSwgMjAyNSBhdCA2OjM14oCvUE0gVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEluIGR3YzNfZ29vZ2xlX3N1
c3BlbmQoKSwgbG9va3MgbGlrZSBpc19oaWJlcm5hdGlvbiBpcyBzZXQgYWZ0ZXIgeW91DQo+ID4g
ZW5hYmxlIHBtZSBpcnEsIHByb2JhYmx5IHZlcnkgdW5saWtlbHksIGJ1dCBjYW4gdGhlIGludGVy
cnVwdCBiZQ0KPiA+IGFzc2VydGVkIHRoZW4/IElmIHNvLCB3aWxsIHRoZXJlIGJlIGFub3RoZXIg
aW50ZXJydXB0IGFzc2VydGVkPw0KPiA+IE90aGVyd2lzZSB0aGUgY3VycmVudCBsb2dpYyBtYXkg
dGhpbmsgaXQgd2FzIHNwdXJpb3VzIGludGVycnVwdCBhIG1pc3MNCj4gPiBhbiBldmVudC4NCj4g
DQo+IFRoZSBwbWUgaW50ZXJydXB0IGNhbiBvbmx5IGJlIGFzc2VydGVkIGFmdGVyIGNvbnRyb2xs
ZXIgaXMgaW4NCj4gaGliZXJuYXRpb24sIHRoYXQgaXMsIGFmdGVyIHRoZSB1c2IgcHN3IGRvbSBp
cyB0dXJuZWQgb2ZmIGFuZA0KPiB0aGUgZHdjM19nb29nbGVfdXNiX3Bzd19wZF9ub3RpZmllcigp
IGNhbGxiYWNrIGlzDQo+IGNvbXBsZXRlZC4gU28gbm8sIHRoZSBpbnRlcnJ1cHQgd29uJ3QgZmly
ZSBiZWZvcmUgaXNfaGliZXJuYXRpb24NCj4gaXMgc2V0Lg0KDQpUaGFua3MgZm9yIHRoZSBjb25m
aXJtYXRpb24uDQoNCg0KPHNuaXA+DQoNCg0KPiA+ID4gPg0KPiA+ID4gPiBJJ20gc3RpbGwgdHJ5
aW5nIHRvIHdyYXAgbXkgaGVhZCBhcm91bmQgaG93IHVzYl90b3BfcGQsIHVzYl9wc3dfcGQsIGFu
ZA0KPiA+ID4gPiB0aGUgZ29vZ2xlLT5kZXYgYXJlIHdvcmtpbmcgdG9nZXRoZXIgaW4gdGhlIGds
dWUgaGVyZSwgcGFydGljdWxhcmx5IHdoeQ0KPiA+ID4gPiB1c2JfdG9wX3BkIGlzIG5lZWRlZC4g
SXQgc2VlbXMgdXNiX3RvcF9wZCBzaG91bGRuJ3QgYmUgaGFuZGxlZCBieSB0aGlzDQo+ID4gPiA+
IGdsdWVkPyBEbyB5b3UgZG8gYW55dGhpbmcgZXhjZXB0IHNldHRpbmcgd2FrZXVwLWNhcGFibGU/
DQo+ID4gPiA+DQo+ID4gPiA+IEJSLA0KPiA+ID4gPiBUaGluaA0KPiA+ID4NCj4gPiA+IFRvIHBy
b3ZpZGUgbW9yZSBjb250ZXh0LCB0aGUgdW5kZXJseWluZyB1c2IgcG93ZXIgZG9tYWluIGhhcyAz
IHBvd2VyDQo+ID4gPiBzdGF0ZXM6IEZ1bGwgUG93ZXIsIFBvd2VyIEdhdGVkLCBPZmYuIFRoZSB1
c2JfdG9wX3BkIGFuZCB1c2JfcHN3X3BkDQo+ID4gPiBhcmUgdGhlIGxvZ2ljYWwgcG93ZXIgZG9t
YWlucyB0byByZXByZXNlbnQgdGhlIDMgcG93ZXIgc3RhdGVzLg0KPiA+ID4gLSBGdWxsIFBvd2Vy
OiAgICAgdXNiX3Bzd19wZCBPTiwgICB1c2JfdG9wX3AgT04uDQo+ID4gPiAtIFBvd2VyIEdhdGVk
OiB1c2JfcHN3X3BkIE9GRiwgdXNiX3RvcF9wIE9OLg0KPiA+ID4gLSBPZmY6ICAgICAgICAgICAg
ICAgICB1c2JfcHN3X3BkIE9GRiwgdXNiX3RvcF9wIE9GRi4NCj4gPiA+DQo+ID4gPiBUbyBlbnRl
ciBoaWJlcm5hdGlvbiwgdGhlIHVzYiBwb3dlciBkb21haW4gbXVzdCBlbnRlciBQb3dlciBHYXRl
ZA0KPiA+ID4gc3RhdGUuIFRvIGFjaGlldmUgdGhpcywgdGhpcyBnbHVlIGRyaXZlciBob2xkcyBh
IGhhbmRsZSB0byB1c2JfdG9wX3BkDQo+ID4gPiBhbmQgd291bGQgY2FzdCBhIHZvdGUgdG8ga2Vl
cCBpdCBPTiB3aGVuIGF0dGVtcHRpbmcgdG8gZW50ZXINCj4gPiA+IGhpYmVybmF0aW9uLiBJbiBh
ZGRpdGlvbiwgdGhlIHVzYl9wc3dfcGQgcnVudGltZSBQTSBpcyBkaXJlY3RseSB0aWVkDQo+ID4g
PiB0byBnb29nbGUtPmRldiBzbyB0aGF0IHVzYl9wc3dfcGQgd291bGQgYmUgT0ZGIHdoZW4gZ29v
Z2xlLT5kZXYNCj4gPiA+IHN1c3BlbmRzLiBUb2dldGhlciwgdGhlIHVzYiBwb3dlciBkb21haW4g
d291bGQgcmVhY2ggUG93ZXIgR2F0ZWQNCj4gPiA+IHN0YXRlIHdoZW4gZGV2aWNlIHN1c3BlbmRz
Lg0KPiA+ID4NCj4gPiA+IEkgaG9wZSB0aGlzIGluZm9ybWF0aW9uIGhlbHBzLg0KPiA+ID4NCj4g
Pg0KPiA+IFllcy4gVGhpcyBpcyB2ZXJ5IGhlbHBmdWwuDQo+ID4NCj4gPiBTbywgd2hpbGUgdGhl
IGdsdWUgZHJpdmVyIGlzIGJvdW5kLCB1c2JfdG9wX3BkIGlzIGFsd2F5cyBPTj8gRXZlbiB3aGVu
DQo+ID4geGhjaSBkcml2ZXIgaXMgbm90IGJvdW5kIG9yIHdoZW4gaW4gZGV2aWNlIG1vZGU/DQo+
IA0KPiBTaW5jZSB1c2JfdG9wX3BkIGlzIHRoZSBwYXJlbnQgcG93ZXIgZG9tYWluIG9mIHVzYl9w
c3dfcGQsIGFuZA0KPiB1c2JfcHN3X3BkIFJQTSBpcyBkaXJlY3RseSB0aWVkIHRvIGdsdWUgZGV2
aWNlLCB1c2JfdG9wX3BkIHdvdWxkDQo+IGJlIE9OIHdoZW4gZ2x1ZSBkZXZpY2UgaXMgYWN0aXZl
IChiZWNhdXNlIHVzYl9wc3dfcGQgaXMgT04pDQo+IGFuZCB3b3VsZCBiZSBPRkYgd2hlbiBnbHVl
IGRldmljZSBzdXNwZW5kcyBpbiBub24taGliZXJuYXRpb24NCj4gc2NlbmFyaW9zIChiZWNhdXNl
IHVzYl9wc3dfcGQgaXMgT0ZGKS4gSW4gaGliZXJuYXRpb24gc2NlbmFyaW8sDQo+IGEgdm90ZSBp
cyBjYXN0ZWQgZm9yIHVzYl90b3BfcGQgdG8ga2VlcCBpdCBvbiBldmVuIHdoZW4gdGhlDQo+IGds
dWUgZGV2aWNlIGlzIHN1c3BlbmRlZCBhbmQgdXNiX3Bzd19wZCBpcyBPRkYuDQo+IA0KPiBUbyB5
b3VyIHF1ZXN0aW9uLCB1c2JfdG9wX3BkIGlzIG5vdCBhbHdheXMgT04gYmVjYXVzZSBpdCB3b3Vs
ZCBiZQ0KPiB0dXJuZWQgb2ZmIHdoZW4gdGhlIGdsdWUgZGV2aWNlIHN1c3BlbmRzIGluIG5vbi1o
aWJlcm5hdGlvbiBzY2VuYXJpby4NCj4gV2hlbiBpbiBkZXZpY2UgbW9kZSBhbmQgcHJvdmlkZWQg
ZHdjMyBkZXYgaXMgYWN0aXZlLCB1c2JfdG9wX3BkDQo+IHdvdWxkIGJlIE9OIGJlY2F1c2UgaXRz
IGNoaWxkIHVzYl9wc3dfcGQgaXMgT04uDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0
aW9uIGFuZCBiZWFyaW5nIHdpdGggbXkgcXVlc3Rpb25zLg0KDQpJZiB0aGVyZSdzIG5vIGRldmlj
ZSBjb25uZWN0ZWQsIGRvIHlvdSByb2xlLXN3aXRjaCBiYWNrIHRvIGRlZmF1bHQgbW9kZT8NCk9m
dGVuIEkgc2VlIHRoYXQgdGhlIHJvbGUtc3dpdGNoIGlzIGRlZmF1bHRlZCB0byBwZXJpcGhlcmFs
IGFuZCBzd2l0Y2gNCnRvIGRlZmF1bHQgbW9kZSBpZiB0aGVyZSdzIG5vIGNvbm5lY3Rpb24uDQoN
Ckkgd2FudCB0byBjaGVjayB0aGUgY2FzZSB3aGVyZSB0aGUgZGV2aWNlIG1heSB3YWtldXAgYnkg
Y29ubmVjdGlvbiBidXQNCmNhbm5vdCBiZWNhdXNlIGl0IGlzIG5vdCBpbiBob3N0IG1vZGUuIERv
IHlvdSBoYXZlIGEgc2VwYXJhdGUNClRDUEMvY29ubmVjdG9yIHRoYXQgY2FuIHdha2V1cCB0aGUg
c3lzdGVtIG9uIGF0dGFjaG1lbnQ/DQoNCkJSLA0KVGhpbmg=
