Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD145348895;
	Thu,  6 Nov 2025 23:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762472997; cv=fail; b=Zketff3+sVSJ5VeQGD7GVUxLfnrYRWCFrGLbIBPb7i1o2G+xHDhgObN2PabHunlWEQQ+/6DY1CJQtV6u6SRHAK9FXI9lA+RlVoDRvZLCd12Xk6fQleQfVKA0nQmIlCg3JZ/qFT++0D+hO3JKu80kPoDhPW1C8cEs27EcusUTtRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762472997; c=relaxed/simple;
	bh=8G17cfj+htKk8ec6MW0W3RiYkqYRCBGaBQ6FfJXFqOw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kpOhjjcOX5sYqwj55w0EGGu4EPXkwdXsi4BCo4kUYeZpoLImRutFa+01KlK1O80EWltWjrjH6AJgGsU07JN158BmTP58O6emFSiRpHd3txgTtFhrGFWgcOo54oQ9mOWDNq/j7AmqXfGLgm0bdepYDpZcGFu8APY21V87/WnidY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Un4rJTuo; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e467Yych; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cla5LzL6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Un4rJTuo";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e467Yych";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cla5LzL6"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Me6Jb4140707;
	Thu, 6 Nov 2025 15:48:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8G17cfj+htKk8ec6MW0W3RiYkqYRCBGaBQ6FfJXFqOw=; b=
	Un4rJTuo7D12mWTx4VmQsw5XJYLgXvhfCQp3wSNieowEOtNEGrBYWJyyFxVZFw+L
	tqbHqhz/u0C3XXTCVXNq3Y/5rSjqgU9S2CkdZvtmjrpCAbuk5bEyMhDdUg/y4lsf
	QIPo/Ns9ao9IsxparcdW8kLVbMuoyw9uxkpw9A7OiTxwazg9ZhTN1J5evNb9O37+
	NJa5Oqmp76vZZnmmIgAV8+L7v9XT95plHY/fLjde3wmKU9pKdbEeqOZ4KzlF7hqd
	UucbqYsSf7hKGBHKFcKefYOTsqi+XbxsU//3byVH9/fZrQQwFE6wV7ovN+xBynNQ
	Cpv7tEMcrEmLwRMfoZnBxg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a8x352bye-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 15:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1762472937; bh=8G17cfj+htKk8ec6MW0W3RiYkqYRCBGaBQ6FfJXFqOw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=e467YychupC0wzW/+m1MJ481jv/0v6FZZnexqT1xwXqC9SyXa0uNFby0kHcJ8cDes
	 EVVaVjTzCrvbbKwEUh3NoERO5WU0CoZDmQ2+hHiTtJVypjxDjdXFyhqY5WZuFU47N7
	 fh6IDZBMFBJVuVSMyxzEJvOxa2GOndFJNaXUtJJO3h9k7IfQ3CpC/odgXtV6ZpAPf7
	 YxhMY7Gb/gBtxdnnv3ojiFPGCHYpMAMI6txt2fOxe5TSK/u9Wv0PpXRxiTRM1qrbGu
	 BungmO4of8e5pNPYmKXsXJ0HCPoxqxxGQCF7hMo8iHfJM0kCKtDpy8Taa9XRgSmBTb
	 NPbsIfdI4qcEA==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 61D1740359;
	Thu,  6 Nov 2025 23:48:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DA81CA026F;
	Thu,  6 Nov 2025 23:48:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cla5LzL6;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9E57640354;
	Thu,  6 Nov 2025 23:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAS9zYKFWrtXfY8juVU8H1pi1Hv+jRwZJ6fFpx1tv60PWNPI2Je7sMXV8F6DYZjh/+SJepL6VJqajbf+efjaupcXb+p9yJFegKccfsDLCT2y2XGf7N19QXWiAW92zcN5iysdYw10DhRvgFMAECoKOhcX53JWku8eO+AyFHfPAY/CW60aP+23vLxesUMmgbn9eNA7MrnNPDzn9zBKrVkKLNoL9OopqyBA4EdUNdcfRQFinFzfZA6+b8+71luruSJH5LF/KEXc2vDyLSoA/llVXY8nm8w16LjdZJPR67VuGgHxNXQwo2E/6CqvWupv5nTBAzg8wL1u/oVxqVBzYtr/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G17cfj+htKk8ec6MW0W3RiYkqYRCBGaBQ6FfJXFqOw=;
 b=s4IWJ1x4OFVHTR6WMGd4braL03g8qielRnBlGMHNGKIF2FekRQ6OHGBgiktjNTWWlvGaDT/5C7FIMOhmVeTROuy3y8h9Z5OBdNH7W9m9P1JrWiXx6xFPpDizB2P8/uSf/2/c8A+KIN5miOiccZIkpibMPOpoxEHJbHPni2wFgqAFATvvZvzruP82ZRXrCrm7WNXsGvOd4Kxo84jsFVQMByweh/1tzo5e+BfDJVFUpimHRfw9fC8PHs6wy6HSmI/2Coy3wsPpa4dh00PGYj8yAyt3odFS3nMleRhDqzAjqYbNbdRVMvhABkH2PoGbd95pdEa+vmtI5+Bhuyz5NvhmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G17cfj+htKk8ec6MW0W3RiYkqYRCBGaBQ6FfJXFqOw=;
 b=cla5LzL6kq67BaGNi9qpZWKed07nI8/Yac/k2X8QrcnI2KIEDYvANagGPcaTOvsjiq29x0Un2P5qKXaAD6k2usTmESYnjVaQUGXgbFZSuBE8rvU0beWNZ0YP01OhqHM/wxFenYuzPsQN+SWOdf0haMCgKaIKbj4yl0afjnxY2Ck=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA4PR12MB9834.namprd12.prod.outlook.com (2603:10b6:208:5d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:48:50 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 23:48:50 +0000
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
Thread-Index:
 AQHcP765hkb6mxiuSEGHvmS6Dp7Tg7TZ+2SAgAMX3wCABMy3gIAAk7cAgAJ4KgCAACGmAIABYsGA
Date: Thu, 6 Nov 2025 23:48:50 +0000
Message-ID: <20251106234839.kezpk2okjhkajqp3@synopsys.com>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com>
 <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com>
 <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
 <20251106003830.v22dnomurtqmqc2y@synopsys.com>
 <CA+zupgzNRG3vAukQe89bTJ_EaC2A=o+_pY6QoVOdRfXu8BJOAg@mail.gmail.com>
In-Reply-To:
 <CA+zupgzNRG3vAukQe89bTJ_EaC2A=o+_pY6QoVOdRfXu8BJOAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA4PR12MB9834:EE_
x-ms-office365-filtering-correlation-id: de7d7c2e-6b8f-4446-c392-08de1d8f093b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RjhVVWFnV2RENWg3RkJLalp5Uk5JMjNDazNlanZDWXhMUmp4bVVtMTBGeHVa?=
 =?utf-8?B?TlhOWTkzR3p6NUlmbzZXR1d0TmtqY2hqRHhtMEFick9TQzNvbzFxL1VTZ2ky?=
 =?utf-8?B?VVRiYnFPV2JsaDBRNm5WN1F4a0dKSlZiMWcyeUpaYUl4RzBwMzRMVWJIV2k3?=
 =?utf-8?B?VlAyeVh5ZlVtNkM4NHNINXVMWEtFcDBSMkkwbmZkY0crYWJ4ems3bDZQUUh2?=
 =?utf-8?B?VVdzT1dxVk4vZ3hLc1BrOVhzK0JyZVV3aU41S0RxakIrdU1XczJ5cndCRDZW?=
 =?utf-8?B?SzVFZWpwNi9NdTMyM3dNZG1nUTJjWEd2Zi9LeWZWMUxWeXY0U21TcGR6emU3?=
 =?utf-8?B?TVJoVHd2clFzR2xzVThTNEt0eWhoRWpkdDF0ZktZSkFYRjhoR0s5Y2pnUGdI?=
 =?utf-8?B?cmlXazRNT1IzSWRzeWJlZ21YditxQ0k3Z2lFL3VQTnBuY0N4QW4wdmYwdzU3?=
 =?utf-8?B?N1pnQ0Fab0RmQW5HTzlDeGxsV0ZmMjZyQlQ0VTNaTTEweGdCc002akJzVzZ0?=
 =?utf-8?B?QlE1eldwcmNHWlA1QkhpMWZMN2wzMGtXeGNqU0VDUGx1SEdRR3d0aGlhRitr?=
 =?utf-8?B?YzBvZC92Ykk1TjRlVmV4L3lLVHYvMzI5VFpvWktpMlM0Rk9UNWJUaHFPSm5w?=
 =?utf-8?B?bFpNMjNsTkVWNHpmSHdXWWVKZ05mL1lFRTY5ZWJXYnhRbUFOdzJvNko2OEY0?=
 =?utf-8?B?dm5rQXdBMXArUmgzaXlwVjhwWE41cHF3TExrZTNpZHZCd3I0R3V1VUtxejJV?=
 =?utf-8?B?VExZTlhJNThwWnFXc1dWKzdueHBESWhMb2VHODBKTTJETEtmV0Fua3pwaEZs?=
 =?utf-8?B?QXlZZ0Rlc0dUc3liVFg4cXhSaXRvVUZTemNzR21hNzFrWW5JNHU1bnUxN2R6?=
 =?utf-8?B?T0FXNDBHMWwzRlpOeUovdVFaVXF6ZWFXOWdQMWs1OW5jMHRaR0xneE9LbUVm?=
 =?utf-8?B?Q29FRmgzdEtOWUM3d2JuZUFpaU02M3pPYjRoZjdwZExFNzBoRU11dVI3TnBt?=
 =?utf-8?B?bnlGSUtkeC82TjA5NldkOTM5MjAzTGNlTmxWRlpZeGlSVXh1RkRJbWU3M3BZ?=
 =?utf-8?B?WDJsR2RHbnMrbDhaeExHWXgvR1hXZXp5WjBYTkNTTWRxRHRrSExYSXcyVTBo?=
 =?utf-8?B?WFNLZjlnWFVRdnFPbmNqZDNUMVJwL05HampBK2YrdUdGMmtBOUtYZm4vVC82?=
 =?utf-8?B?ZHVHS1VlZHZqMklIcUxGV1VpVTF6N09rZThSaHR6MjlDTHZKdFl0dXVndHhj?=
 =?utf-8?B?WXFVMC85SDJBclU1N1BjZzhheWowcVdjQi81V2ZkYmkxRmpHU0FmdktzTXRD?=
 =?utf-8?B?VThEWTNtR0NOK1hDZkNscE5qMjQvdDQ4M0JZYUdtZVZVSGJmRE9nY3AwV2k1?=
 =?utf-8?B?ZGw1QVJIMGhVRC9lRnBjN29vS0dLMDAyR2FDNTdNd2N2SWlBdXE2aGRvNkds?=
 =?utf-8?B?cWU3Rm51VEt4Rm1FRkoxRVhIN28yOVB3VDlnQTVPZFZtOVpJR0dYaENpRGFq?=
 =?utf-8?B?Vk9qK1hXc0x2U2hKWXNwTjI3N2N1Y2ErbTJ6bVBGZUxoSVdJRFBtamlucThw?=
 =?utf-8?B?M0RQT3BIWTZxQzNLblFFYUFsNW9lS3kvM0phcDlZVG5HcTBoUWNBWUEwU3ls?=
 =?utf-8?B?SiszTjJIT01HMFFTWlR1WmJYUTNqM2ZVby85SlBYbHZlZmFQRFlqb2hNTVEx?=
 =?utf-8?B?RG55L1kxSkZSSTVxUTkzT2ZSZVpZMCtBaEQvbFFyMDRhWEJzK2JydmI5Q1lG?=
 =?utf-8?B?eDdyNnBuZXZWa3ZhODhwc3h3dXIwOGRMdmJGajhJWGpxeDcvbU1leWdBVXVL?=
 =?utf-8?B?V2MxR1R6ODRqK3dVWUFGRmt6akV3dDZ3SmtscmMyYndVVWFFMEtiSndJeG5B?=
 =?utf-8?B?RG1JeHhtUnJwS3ZDMTA4SDYySVpxMERtZi94clFhSUFaQW55dnRGc0ZzOGxJ?=
 =?utf-8?B?MDUxUHAxVkpTa1ZqM3NvMjREU0pGaStsRTYzMEJ0Q1RoclZ1ZFY2Y0xSM1Ro?=
 =?utf-8?B?NHRCT1NGVzFWaUdMcnRqNVVoaXFQSHVGNXF5bkJVdFFSQ0pMajRJdHFyalpL?=
 =?utf-8?Q?VJbaoh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3B3Y0Z2NjFBdDFXWTFmaUhiMTdRVDJFNmE2RkxNSHVXZXZNaCtOcXJGYWN1?=
 =?utf-8?B?QmJKL0hmcmYwZ1FwaDZCTGJ6QnlMNER6M0l6bFVIcmQ2Mk1NaDNWazZqYmtK?=
 =?utf-8?B?S0ZSNEUzSTViUnppU1J3NDhURkpYa2FKaUtEanRKTk9XUHpjbGxYdjkvSzBw?=
 =?utf-8?B?ZEN1VXl3NFI4bkkwTTl6cWFTVjUzZHNqOGkvNnIwK0E4SDk3ckl0NnRTRlRm?=
 =?utf-8?B?YU1PaEo0TkhCOUw4ZlJVSnJjcjBHUTArVEdOWmt6Ky9TMFZyOHJNQzNCNis1?=
 =?utf-8?B?VHJwMkxxRU1KdmowSW5xeFZFd0FYWCsxMXpyQkNyMWQ3UnhjTVdYclQ2UVNa?=
 =?utf-8?B?Ym1zWkJvc3NuSFAvZXFkTVlVRHlGNXpPcnY2aXBoV1dGazdaOTF1SmlBM25m?=
 =?utf-8?B?cTJENDExUnZvNnlFVkFXNFhoVVpYOHZoSGphZXVXc2Uwb0w4TGRiK01JQlhz?=
 =?utf-8?B?S2NuS1FDUXhUMXBhQVl6dWN6M29xeURRUXpNV2RvU05tU1RlWFYvNW56Q2VW?=
 =?utf-8?B?WExkbHlWOGNmOWxYQ25MRmI1ZkRSYXlCWVhuYlVCS1dmQ1hQaG1yRlhwQVlp?=
 =?utf-8?B?UG02djl0M1pYM0FEM1I2NmNnVEk4V0dCK2hKSVV2a1hVR3I3MktVSDQwTE5q?=
 =?utf-8?B?V0JIY0tTSFROK1dnYkJCNE92SEtWaFArQ20xdUxQem95K2lPemF4Q1lsWGNU?=
 =?utf-8?B?VlEvN1pMR1N3SmVySVFselVzaHNLQWRzaEZwbFVZNDZ0UEoxbFZWKzVPRGhC?=
 =?utf-8?B?N3FaakpxaFRHRkpFZlBqeElWU1FXYVVyTEJLQUFDdjQ0dC9CWDRabS8xQmp1?=
 =?utf-8?B?T0F2STlTV2poU1JZdlkzQXhpWURUSVdDQ2RuVko4K3UrUVZrVU53cGNjUnYv?=
 =?utf-8?B?aFRaeWs4c1VUV0RQcytTMlA0anE3SjQwVXJENjBqR05lbk5yNHo0elpSTDRZ?=
 =?utf-8?B?Q1o1ZzlMUmcrWGM3blBvcHJQMVZ1WDdxRUtuZVFhK05EejB5YUovYUs5b2U1?=
 =?utf-8?B?VDd2a28vWmhPc3RKUnhQOEl4WWdEU0M2R05TTVptVkF1MmpoUXlGL2FMOVlW?=
 =?utf-8?B?RHk2eGU5QmpLMGlMWVVzMWxob1lSdWNnWnkzN1JxbERkSXczdUlkMHozc1l2?=
 =?utf-8?B?RVJNNk1lbGdkTkg3YWJYa0xnNUQ5MjFRK1l0dDVIcU9PejM3TkVmZjBxeng5?=
 =?utf-8?B?QldjZnBqRXNBWmxiK3FwMjRKZWJEVk5xaW5CV21tdUkzV0N5MURIRFJpYlVx?=
 =?utf-8?B?a0FWOEZOWmk1elFWL1VjTmdMTm85dzNuTENRRHBKT1FRUDc3QWh2dHhIMlI1?=
 =?utf-8?B?YTBtdmFOQWFxZCtCVmxaSkRHWG80S00vSTg0c3hidUVlTU9kQnNLZGtDdFRX?=
 =?utf-8?B?bTBDUUJISmdaQzVOV1hCaUlvWFpqNHlkYWZDb1I2bHdvY2lQektaS21VYm85?=
 =?utf-8?B?WFRodU5TelYrcGVZNU9KbDFVWVByWVpsUWlvTEUvbDhkTExaa1pqaHBjdGIx?=
 =?utf-8?B?WlY0NlB2dlRyckJGTk9tQWxRN052dWVPVWRJMlBnZ3hPVTF5djFET0tXUDh4?=
 =?utf-8?B?QzE2MmtxWUFRUXhjL2RqblZJRG85UkhTMGVYMjN4SHI5L1BETi9xUHJ0Y2xk?=
 =?utf-8?B?SnpPUExOTk5CVFUrRmh4WXhEUFR6R0M0SmpoYWU5aUJ4bzdRc3B1V21NUU5w?=
 =?utf-8?B?UWM3N3JYMCsrdWRnZkJEK1dCdWIvMCt6RFZ5UWt5dGhoZUU0OVhGLytUZUNk?=
 =?utf-8?B?b3FZTnBtelVxZU4xVG9MdXRWVTM0L05TY0I1bnRRRC91WEtKYUF5d2x2WnNp?=
 =?utf-8?B?WThVZE1ETWVidldHU0QrV1FTcm11L3lQbDh6WEM4Q0U3cUJ2TFk0ZHFRMm5j?=
 =?utf-8?B?Y2tsWG8yVzRCRGphVHV5RFlYQWFST1E4Z0xPWXFxVnNjbm9PT0prc3hqQ3VF?=
 =?utf-8?B?ZWZZTC9hV2VWVCtoUG8yaW4wRk0zN1d6aHJEenFsOTZXVkF0WTllbkZWcUtS?=
 =?utf-8?B?OVJDSnNRUGVtMW5xbGlZUWpyZG81UWhoaFRHVDBaTnU2MS9BS2pVK05uN1Ev?=
 =?utf-8?B?YXBTVmZaWmswMTgvVDlxMDNNa1MrRCt3dzRuSkZzS0xFZHI2aDJINmdJT25E?=
 =?utf-8?Q?7YxtcHcBM1r69n33x7aLbjf7p?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40E4212321757C449A495609E01CE217@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pV1zkZQb3T40xLzqd6uJOsCiVBqTIOaY8ardl5BG2VSbA6zpHHwaiNApJNq5gws7rXULVVp0A3f/V8pHFvk19H1POX5oNMZPpbtIFdKbLjmbx4aJZms6PJTlX3EYAysaPaPjkAt2XC8lcQB+U39X6bPb/y5ITFA4T3HIJbpto4yUHt3PDMe7l+3ZEiSqQ2CzlBOLRDmJ9Z2BV4YMxXkpjgh/bHmhsaETweu6myKqATmx/rwrvId6aixeeGQzsqpYKGLaKRnRXSNW6LRAxW7k2msx5BY9Vwsg6lx7MKOX3SwVZM25l5JhspYBeC31sCjuY/Ii85UuhGOZrQDMyQXbRk1qJiD7w5DpS9tvKetQsCKQFDDpiHeq6KyaFPiwvcNqojSKtoEv5S39xQUBiLmImKB5KUr9q5Fq6R9e9IS5bBc6i2Ntr3+6jTU+AzrxP/4MADywH7P2x/A3o8HfHa8qqb2zC+5NGN3Ybx9eTQX6BvxOVWTMDmiW1VSbPERz+YzqSpeNdMoo2n1Y1+5Ew4ivi3gNZ/jgE/nOfyMY9Kv+HOO7Sei10XAStlyvD5svxbOym/V77Bre9uIYhM57WnzbUIx17vckJZ3cdnBYLvu5smo2ptWdRDCT4XXSCM5pfJMX9d4TsnDuVQudcrqEBLk/6A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7d7c2e-6b8f-4446-c392-08de1d8f093b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 23:48:50.5028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STju/Ue9Um/t415UsAoDLwA7LwpF/T49ONcL6Fv/tqWKOA7ZNHbS72V8eg/rOQuamWed/x57ZTE7hdyoB7cWOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9834
X-Proofpoint-GUID: pXp3Ib7Wpb0UE3lN6gsP_uKnh7wubqGU
X-Authority-Analysis: v=2.4 cv=Utdu9uwB c=1 sm=1 tr=0 ts=690d33e9 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=85iICjhuhtVI9kq5HhAA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: pXp3Ib7Wpb0UE3lN6gsP_uKnh7wubqGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE5NCBTYWx0ZWRfX/CHFa5hhm5tC
 yMYSRMUvRV83Cp6pZ4xnuV0kPAG7VMZ4OfLiLapeOcdXIxLE3Ml5+7RLkJGvdheXRtbl+IVMB5i
 mMSpif103IsThiF6QFxOD24kXVSmJnTCo5F0xI7xzAqOyV82gy+l8K5qqiKQ9sGdPmJW9I8tTnx
 LghGOFP/FdSH0WBMQcz8ujDv2+hqGzFi0Wg4MOhZUsVxckyDg5HG17BBQ2V4ReqsVm3llCLfeEU
 XAWs2RZd65qh8cVLgETQdgHQz/pWJugHIqxEuFarMI2cP5PQV6i5XVA45HSYfzgnHdYMhKDz4Sv
 NtQHABDHEp/TJAAgpb2o/qbXE2913WPCeHaHoQ3twdHAUp27eJrkbrb5a3jL2dDV0CSRVuJRblR
 Ef2si6G6BqZA10xupD4xRpQo4ZqX7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511060194

T24gVGh1LCBOb3YgMDYsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IE9uIFRodSwgTm92IDYsIDIw
MjUgYXQgODozOOKAr0FNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUsIE5vdiAwNCwgMjAyNSwgUm95IEx1byB3cm90ZToNCj4g
PiA+IE9uIFR1ZSwgTm92IDQsIDIwMjUgYXQgMTA6MDfigK9BTSBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBGcmksIE9j
dCAzMSwgMjAyNSwgUm95IEx1byB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIE9jdCAyOSwgMjAy
NSBhdCA2OjM14oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3
cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gSW4gZHdjM19nb29nbGVfc3VzcGVuZCgpLCBsb29rcyBs
aWtlIGlzX2hpYmVybmF0aW9uIGlzIHNldCBhZnRlciB5b3UNCj4gPiA+ID4gZW5hYmxlIHBtZSBp
cnEsIHByb2JhYmx5IHZlcnkgdW5saWtlbHksIGJ1dCBjYW4gdGhlIGludGVycnVwdCBiZQ0KPiA+
ID4gPiBhc3NlcnRlZCB0aGVuPyBJZiBzbywgd2lsbCB0aGVyZSBiZSBhbm90aGVyIGludGVycnVw
dCBhc3NlcnRlZD8NCj4gPiA+ID4gT3RoZXJ3aXNlIHRoZSBjdXJyZW50IGxvZ2ljIG1heSB0aGlu
ayBpdCB3YXMgc3B1cmlvdXMgaW50ZXJydXB0IGEgbWlzcw0KPiA+ID4gPiBhbiBldmVudC4NCj4g
PiA+DQo+ID4gPiBUaGUgcG1lIGludGVycnVwdCBjYW4gb25seSBiZSBhc3NlcnRlZCBhZnRlciBj
b250cm9sbGVyIGlzIGluDQo+ID4gPiBoaWJlcm5hdGlvbiwgdGhhdCBpcywgYWZ0ZXIgdGhlIHVz
YiBwc3cgZG9tIGlzIHR1cm5lZCBvZmYgYW5kDQo+ID4gPiB0aGUgZHdjM19nb29nbGVfdXNiX3Bz
d19wZF9ub3RpZmllcigpIGNhbGxiYWNrIGlzDQo+ID4gPiBjb21wbGV0ZWQuIFNvIG5vLCB0aGUg
aW50ZXJydXB0IHdvbid0IGZpcmUgYmVmb3JlIGlzX2hpYmVybmF0aW9uDQo+ID4gPiBpcyBzZXQu
DQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24uDQo+ID4NCj4gPg0KPiA+IDxz
bmlwPg0KPiA+DQo+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJJ20gc3RpbGwgdHJ5aW5n
IHRvIHdyYXAgbXkgaGVhZCBhcm91bmQgaG93IHVzYl90b3BfcGQsIHVzYl9wc3dfcGQsIGFuZA0K
PiA+ID4gPiA+ID4gdGhlIGdvb2dsZS0+ZGV2IGFyZSB3b3JraW5nIHRvZ2V0aGVyIGluIHRoZSBn
bHVlIGhlcmUsIHBhcnRpY3VsYXJseSB3aHkNCj4gPiA+ID4gPiA+IHVzYl90b3BfcGQgaXMgbmVl
ZGVkLiBJdCBzZWVtcyB1c2JfdG9wX3BkIHNob3VsZG4ndCBiZSBoYW5kbGVkIGJ5IHRoaXMNCj4g
PiA+ID4gPiA+IGdsdWVkPyBEbyB5b3UgZG8gYW55dGhpbmcgZXhjZXB0IHNldHRpbmcgd2FrZXVw
LWNhcGFibGU/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQlIsDQo+ID4gPiA+ID4gPiBUaGlu
aA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVG8gcHJvdmlkZSBtb3JlIGNvbnRleHQsIHRoZSB1bmRl
cmx5aW5nIHVzYiBwb3dlciBkb21haW4gaGFzIDMgcG93ZXINCj4gPiA+ID4gPiBzdGF0ZXM6IEZ1
bGwgUG93ZXIsIFBvd2VyIEdhdGVkLCBPZmYuIFRoZSB1c2JfdG9wX3BkIGFuZCB1c2JfcHN3X3Bk
DQo+ID4gPiA+ID4gYXJlIHRoZSBsb2dpY2FsIHBvd2VyIGRvbWFpbnMgdG8gcmVwcmVzZW50IHRo
ZSAzIHBvd2VyIHN0YXRlcy4NCj4gPiA+ID4gPiAtIEZ1bGwgUG93ZXI6ICAgICB1c2JfcHN3X3Bk
IE9OLCAgIHVzYl90b3BfcCBPTi4NCj4gPiA+ID4gPiAtIFBvd2VyIEdhdGVkOiB1c2JfcHN3X3Bk
IE9GRiwgdXNiX3RvcF9wIE9OLg0KPiA+ID4gPiA+IC0gT2ZmOiAgICAgICAgICAgICAgICAgdXNi
X3Bzd19wZCBPRkYsIHVzYl90b3BfcCBPRkYuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUbyBlbnRl
ciBoaWJlcm5hdGlvbiwgdGhlIHVzYiBwb3dlciBkb21haW4gbXVzdCBlbnRlciBQb3dlciBHYXRl
ZA0KPiA+ID4gPiA+IHN0YXRlLiBUbyBhY2hpZXZlIHRoaXMsIHRoaXMgZ2x1ZSBkcml2ZXIgaG9s
ZHMgYSBoYW5kbGUgdG8gdXNiX3RvcF9wZA0KPiA+ID4gPiA+IGFuZCB3b3VsZCBjYXN0IGEgdm90
ZSB0byBrZWVwIGl0IE9OIHdoZW4gYXR0ZW1wdGluZyB0byBlbnRlcg0KPiA+ID4gPiA+IGhpYmVy
bmF0aW9uLiBJbiBhZGRpdGlvbiwgdGhlIHVzYl9wc3dfcGQgcnVudGltZSBQTSBpcyBkaXJlY3Rs
eSB0aWVkDQo+ID4gPiA+ID4gdG8gZ29vZ2xlLT5kZXYgc28gdGhhdCB1c2JfcHN3X3BkIHdvdWxk
IGJlIE9GRiB3aGVuIGdvb2dsZS0+ZGV2DQo+ID4gPiA+ID4gc3VzcGVuZHMuIFRvZ2V0aGVyLCB0
aGUgdXNiIHBvd2VyIGRvbWFpbiB3b3VsZCByZWFjaCBQb3dlciBHYXRlZA0KPiA+ID4gPiA+IHN0
YXRlIHdoZW4gZGV2aWNlIHN1c3BlbmRzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBob3BlIHRo
aXMgaW5mb3JtYXRpb24gaGVscHMuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gWWVzLiBU
aGlzIGlzIHZlcnkgaGVscGZ1bC4NCj4gPiA+ID4NCj4gPiA+ID4gU28sIHdoaWxlIHRoZSBnbHVl
IGRyaXZlciBpcyBib3VuZCwgdXNiX3RvcF9wZCBpcyBhbHdheXMgT04/IEV2ZW4gd2hlbg0KPiA+
ID4gPiB4aGNpIGRyaXZlciBpcyBub3QgYm91bmQgb3Igd2hlbiBpbiBkZXZpY2UgbW9kZT8NCj4g
PiA+DQo+ID4gPiBTaW5jZSB1c2JfdG9wX3BkIGlzIHRoZSBwYXJlbnQgcG93ZXIgZG9tYWluIG9m
IHVzYl9wc3dfcGQsIGFuZA0KPiA+ID4gdXNiX3Bzd19wZCBSUE0gaXMgZGlyZWN0bHkgdGllZCB0
byBnbHVlIGRldmljZSwgdXNiX3RvcF9wZCB3b3VsZA0KPiA+ID4gYmUgT04gd2hlbiBnbHVlIGRl
dmljZSBpcyBhY3RpdmUgKGJlY2F1c2UgdXNiX3Bzd19wZCBpcyBPTikNCj4gPiA+IGFuZCB3b3Vs
ZCBiZSBPRkYgd2hlbiBnbHVlIGRldmljZSBzdXNwZW5kcyBpbiBub24taGliZXJuYXRpb24NCj4g
PiA+IHNjZW5hcmlvcyAoYmVjYXVzZSB1c2JfcHN3X3BkIGlzIE9GRikuIEluIGhpYmVybmF0aW9u
IHNjZW5hcmlvLA0KPiA+ID4gYSB2b3RlIGlzIGNhc3RlZCBmb3IgdXNiX3RvcF9wZCB0byBrZWVw
IGl0IG9uIGV2ZW4gd2hlbiB0aGUNCj4gPiA+IGdsdWUgZGV2aWNlIGlzIHN1c3BlbmRlZCBhbmQg
dXNiX3Bzd19wZCBpcyBPRkYuDQo+ID4gPg0KPiA+ID4gVG8geW91ciBxdWVzdGlvbiwgdXNiX3Rv
cF9wZCBpcyBub3QgYWx3YXlzIE9OIGJlY2F1c2UgaXQgd291bGQgYmUNCj4gPiA+IHR1cm5lZCBv
ZmYgd2hlbiB0aGUgZ2x1ZSBkZXZpY2Ugc3VzcGVuZHMgaW4gbm9uLWhpYmVybmF0aW9uIHNjZW5h
cmlvLg0KPiA+ID4gV2hlbiBpbiBkZXZpY2UgbW9kZSBhbmQgcHJvdmlkZWQgZHdjMyBkZXYgaXMg
YWN0aXZlLCB1c2JfdG9wX3BkDQo+ID4gPiB3b3VsZCBiZSBPTiBiZWNhdXNlIGl0cyBjaGlsZCB1
c2JfcHN3X3BkIGlzIE9OLg0KPiA+ID4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmlj
YXRpb24gYW5kIGJlYXJpbmcgd2l0aCBteSBxdWVzdGlvbnMuDQo+ID4NCj4gPiBJZiB0aGVyZSdz
IG5vIGRldmljZSBjb25uZWN0ZWQsIGRvIHlvdSByb2xlLXN3aXRjaCBiYWNrIHRvIGRlZmF1bHQg
bW9kZT8NCj4gPiBPZnRlbiBJIHNlZSB0aGF0IHRoZSByb2xlLXN3aXRjaCBpcyBkZWZhdWx0ZWQg
dG8gcGVyaXBoZXJhbCBhbmQgc3dpdGNoDQo+ID4gdG8gZGVmYXVsdCBtb2RlIGlmIHRoZXJlJ3Mg
bm8gY29ubmVjdGlvbi4NCj4gDQo+IFllcywgdGhlIGRlZmF1bHQgbW9kZSB3b3VsZCBiZSBwZXJp
cGhlcmFsIGFuZCBpdCB3b3VsZCBzd2l0Y2gNCj4gdG8gcGVyaXBoZXJhbCBtb2RlIGlmIHRoZXJl
J3Mgbm8gY29ubmVjdGlvbi4NCj4gDQo+ID4NCj4gPiBJIHdhbnQgdG8gY2hlY2sgdGhlIGNhc2Ug
d2hlcmUgdGhlIGRldmljZSBtYXkgd2FrZXVwIGJ5IGNvbm5lY3Rpb24gYnV0DQo+ID4gY2Fubm90
IGJlY2F1c2UgaXQgaXMgbm90IGluIGhvc3QgbW9kZS4gRG8geW91IGhhdmUgYSBzZXBhcmF0ZQ0K
PiA+IFRDUEMvY29ubmVjdG9yIHRoYXQgY2FuIHdha2V1cCB0aGUgc3lzdGVtIG9uIGF0dGFjaG1l
bnQ/DQo+IA0KPiBZZXMsIHRoZXJlJ3MgYSBzZXBhcmF0ZSBUQ1BDL2Nvbm5lY3RvciB0byB0cmln
Z2VyIGEgcm9sZQ0KPiBzd2l0Y2ggd2hlbiB0aGVyZSdzIGFuIGluY29taW5nIGNvbm5lY3Rpb24u
DQo+IA0KDQpUaGlzIGFkZHJlc3NlZCBteSBjb25jZXJucy4gTXkgb3RoZXIgY29tbWVudHMgYXJl
IG1pbm9yIG5pdHMuDQoNCllvdSBjYW4gaW5jbHVkZSB0aGlzIG9uIHlvdXIgbmV4dCBzdWJtaXNz
aW9uOg0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29t
Pg0KDQpUaGFua3MsDQpUaGluaA==
