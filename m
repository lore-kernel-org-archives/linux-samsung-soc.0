Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831C35975;
	Thu, 30 Oct 2025 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761786192; cv=fail; b=ZB0ggdKxhi7iu0pviJtjx48unYYfbI87m9Rma7X2BESdRn0XeuaePKMp+ILG+gkASNNXYBXUDYw4rZC20rrbY2kVBq7P5qvyapTHfS0uCV5vl8t3eBXkSgIqfir8gVfk5gTWUuqMSZxKNgAcNBOX98NKWfeEXaxa38PitHXb0UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761786192; c=relaxed/simple;
	bh=dH4CFK64IqIZvQwdo1OFt5yf0mM8jMZRowEX1w9uVvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ105n9hMVnvwUsDAYUtilpLWmmo7UeZ/7dYZa/CzqorTLdfE0cQPbsI3NehtOYvv5L6BURHQQyR5fdRgj3czZCw9jCi7b2730JBGBuycXr8mAZ6N5srpxej+j+f8Vo8Gu7lxPRb1zba6z71ZbQGEZW9jyqZMMphRfHiQh+yF2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=r4C+evAV; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ghW7oe7V; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nn+OabCd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="r4C+evAV";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ghW7oe7V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nn+OabCd"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TIPPAa4090459;
	Wed, 29 Oct 2025 18:02:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=dH4CFK64IqIZvQwdo1OFt5yf0mM8jMZRowEX1w9uVvg=; b=
	r4C+evAVq3vJuY5sz+QCSe4tS4ei/Wui08N32WFAnYgf2uDZYMuG3Awa7FOErTXg
	hiyzMGQiknvq87gly/ZFi1GzP9FpkyAeHjM96qcHCR0y1FyFiEswa8fvLIdwwq6z
	QGEMnNjFBCOTOAjA3pfIbq0NaZqfyadUiwkIBpZVh/6vjnxxparxnyD+NjR6r92l
	DYnL8B0lz//vGECF7Lnoh0KEr2o5oITJW6BXCNu1pmAUD+v3D/C9QRTintKRdbtQ
	Oph5yRt541H8s7qQynBjOSg0zt3v4XssD74h5zmZ5vQp9JmlPPA2blJFXUNLy/xz
	DTmHmMOXMz1mJ7z2NtW67g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a349fydd8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 18:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1761786154; bh=dH4CFK64IqIZvQwdo1OFt5yf0mM8jMZRowEX1w9uVvg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ghW7oe7VFnMJeaUvvEGHjDqLa2ulKDvatkT8yA/9htRkmw19NGL8ce4yWy9rJHEeL
	 1av07BYvpnsxPTupjPDmAePmhDYcf3/9SpYDVQ07ksJ4YUibHMma0tkdxIxgTAFjVC
	 oSxx48n06TktdDCRzAk/GKfqrqhUWxcvklTN7WPR45OF+BzaOJjT1k7h2lkABeQEVe
	 XKh/1oiK6O+OyelKkjxis1LmQFrJ4ItKeX0q6QLBihr20eJQzfNF5ad7Uk5e+zlsxS
	 E5BL88yJvIwwlknFNVE/TWPW+NXl05xBbBB2MjKJ/gAX9ouQCG5ll15J7uTIz5fdUE
	 cCW/IAH1Xcz7A==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CBFA44010F;
	Thu, 30 Oct 2025 01:02:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CAD8EA00BC;
	Thu, 30 Oct 2025 01:02:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nn+OabCd;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00402.outbound.protection.outlook.com [40.93.13.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3F99322018E;
	Thu, 30 Oct 2025 01:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/FJH3oup+RgnV/2g5EZVhktk6TVDG9c298pXXzP/o9gYo6EF2aCZy+wPqfqI7E0XojVSAfjLbwOvDu8/ff3VFWU8lvXBf5cGjsgGU9K/w+6MyIEOM6/3XaR5xjKjixau0+IyvYFLWKnmmrvgkqk6bcxY/H17Elx2ZgvLANif27l02I3ptz7gGOa1uv1v0XUF3qQPwb3ykVkGMlpbNKiTzBUx3lhjOiVF6ER76KkDh5TIKbEFGvn6kb3s5jIx5NefF/Ox2tCOXgDBbfODvdzPYGReOVXrCRxy4B/6dEqh3uTZjH8Ra/Jstu7RCwhoWcKOcIOKlzM3kUbliKAU/oEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH4CFK64IqIZvQwdo1OFt5yf0mM8jMZRowEX1w9uVvg=;
 b=qyfEaaPpnqFNPl0j/JKyt99mrSVfJ6TDLxJ29fvgzJl58kMhfYCt8vhwbmVYo25UG0rM6vMKaqJIPah1GBw3uowtQy/s7SaJFGn8wl+jI3S92pFLFl1ISyW+ETffIDB0DUMGuTnnCPUqnDSMIRvfHMHNAhYFOKaWeB+yDeerU8HZA334F46rZRaFR/FHRhn1ri1TqksZeXogqaP/UBGgdZlgOn4eIB0JRF3shLDvTEtwIO2/LqW9sfh61+uDA7cglxGRyZQfARV5NdtDBnwhRf5BXZ/UofSX3I2K/VOl6bxpb/uXVqIjVBvugIbsVmpptfkpVkWTa+KiI2y10OQm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dH4CFK64IqIZvQwdo1OFt5yf0mM8jMZRowEX1w9uVvg=;
 b=nn+OabCdzOHzEUR3FoNSZtjjwFmZdkyC/j+JBvx92hcTxEUCLuk5oPy6O2SUqK3LlslK2/rXgHL7JKsPZZS0a51Fm2rfV95bzkEsN/sRQKeC8RFA3oMJ0tu8s/AxsRCkqOa2z2dPDxX8k39vLtsDpzH+TqTOJtV7x1qH2mpqalA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 01:02:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 01:02:25 +0000
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
Thread-Index: AQHcP765hkb6mxiuSEGHvmS6Dp7Tg7TQXUkAgAGu1oCAB+YMgA==
Date: Thu, 30 Oct 2025 01:02:25 +0000
Message-ID: <20251030010215.q76ytn345nwwcyru@synopsys.com>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-3-royluo@google.com>
 <20251023224302.vdiryshblnkbtsfd@synopsys.com>
 <CA+zupgx9QjT2faWeGtAy_oZffYfEXupPG-GDU9aLisrMGNohdA@mail.gmail.com>
In-Reply-To:
 <CA+zupgx9QjT2faWeGtAy_oZffYfEXupPG-GDU9aLisrMGNohdA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB7141:EE_
x-ms-office365-filtering-correlation-id: 2d90c127-2b17-4720-71bf-08de174ffd9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WXJXV3VlNmRERWhZSWUxM1RjUmJjWG1QSUk2ZXAyOEZOWjlEYUhXOXNaOWlN?=
 =?utf-8?B?ZWJGREdiYjIyYm10cmFSZkZQcEs0OHpIYkVLS2w2ODRsTk5lLzJNN3pyYWJ0?=
 =?utf-8?B?OG8vc284Q2sxRDhyNkhtS3RIc1V2SHpPSEtmTVY2Z1lJcWRMR1dMZ3JOcjU4?=
 =?utf-8?B?UEgvYWxnL3ZpWG5TN282b2J0bnA0Zk9ua1pTUFFRWnhucHJDMENRYUZ3MitL?=
 =?utf-8?B?c3FMeUpaclo3UlFVVlk3RG14LzVtdmJaWHROZUZpek4rNWhkV3F5V1RXZ0Vl?=
 =?utf-8?B?Nk94a0trZnJDMk5lNTB4VUhDK1J1YVpjanozQ0k5ZjJZNUpJSU5LdHJzVkVo?=
 =?utf-8?B?OStYVnZsYWdSVVRqYUhjcEgwaHhVTzlMM2FOdWt6QnBEa3hXb0JtcEFHZEQ1?=
 =?utf-8?B?ckJLbFBRMFBIVXRPditIUytUaWhwZjVUZ3RyekxSVnpKT1B1ak95V1JVNGtE?=
 =?utf-8?B?dDhlYW9WOHkxNElmNDZGNFlsclFNbkRwTTVDN012SXI4NVdUODcxR3kvZXph?=
 =?utf-8?B?WWhRQjVOOHFYWEw4VzNaTCs3S0EzeXQ1N1RaV3JwY2xnRDd2emVRSVdqT3hj?=
 =?utf-8?B?c1p3VkhjRTVaVTE1b3JGUzBHUEFFNTNlNGFGTTZhWThpazlSMWRML3llMWV5?=
 =?utf-8?B?cC9BcUU3akx4dmUrL1pmaXRVc0N0V0NYVzg2c0VFNFQ0UEljYjBTRnRCVGxL?=
 =?utf-8?B?d1E2dm9LWks2Y3IrY0gzelk3NkwvMDI0Qk85S0JpSmptVGQ5NUJBalI4ZXE4?=
 =?utf-8?B?VGF1Q1ZaWUt6c0U0Vlg3azJWY3hlLzJaWTlSRGhVWHU0M2h4cUJ3b2twT2dL?=
 =?utf-8?B?QVdseG1nSDNwSUYzYzBsTzNQZitVa1k4Z3JwOFRCSE9RWkoyTUIxUnpzRGdH?=
 =?utf-8?B?ejZ4VzJvR1VXMkc0ZjE0bjlLelR1K01ITDl3ZHo1TGxyU0c4UnpxTEd0anBl?=
 =?utf-8?B?aUNMK0s4elhjazYvTXpIZ09XcVdhVFpaQkk3WHBscTc0RzNrYXZaMTVqaTA0?=
 =?utf-8?B?WUxHWmpVWXoyeDl6bVA1NzZDZWg4TVJ0bElrTHhrcHc1Z1ZNRVZyL0xGczdB?=
 =?utf-8?B?eXhtV3lwbXF3N3NFSHgzdGdVa3hMbXBabXhXY0tCdm1xUHNsQ1F5QzliQjlo?=
 =?utf-8?B?T1plaUhNcGdrdktiQStwYXVnZ0s2VTZCeUc1TVpBckx6OG5lcnNrRFozZTU0?=
 =?utf-8?B?UHllTHhpMVZJaHF3RDY4S2JjUVA0Zi92QjBIQVlsakZUT3hDSUdhQlJhei96?=
 =?utf-8?B?ZFRBOG1mc3lJZGpNeVdrVVhkL25VVTdnZlZWbnhKc2FWWndWNi9mZ2Q0L0F0?=
 =?utf-8?B?dCtaUzh3T1lXNWQ2UWIwenh5cnNPbFBibHY3MWRRaDZ5VythdWRsVUNRYVBG?=
 =?utf-8?B?Yis1OFdKRnk1dUNmNHVUN0xpbyt3MjhQVHpUdnQ5NmdFYWNCaUNhOHBKM3Ey?=
 =?utf-8?B?VU9oL09pTXJHUXp1S3NyUHNNcmNxdFZrb0VJdnVhRlJ2MkIzemlzSDlObEtq?=
 =?utf-8?B?Mi9kM2tCb1ZvUWQyYkFpZ001NmQrQk1BZ2ZOVjNHTkJYTENYY3hIeXJRdHZw?=
 =?utf-8?B?YzgvREh5MkttOVVnWGtJa1RzWFdxVHJFa3ZQdEJTUEdCRjJmYVV3ZHhxb0s5?=
 =?utf-8?B?QTEyMU1rU29wdDdHVHJZbFVKVHdITE95dUVEWFRGZkFJV21QQkhxOWZnSEhq?=
 =?utf-8?B?aHdGZ3Q2aEFCVTBlRkdLNWNiUy9UQUlJeE8rS2JwMFIyYmcyaGxnNjAxN1Fs?=
 =?utf-8?B?cmplMVVrb3lvQ2x5NDJjVTB1N25ieHZWR3h4cDgrZ0JGQmhHbkJtc2FnOUZj?=
 =?utf-8?B?SUpMcVJVS2R4U3N4VTR1UktORHZBL2Y2cjBJd1RPNVc0bnJGOExNMUhOVFZI?=
 =?utf-8?B?VlhPVWVZQ0kxUkx0K2FNSUhsSVVWS2hISTZpTzJFYzhZdjFja3pRbXhtZkdF?=
 =?utf-8?B?WEVLVVI2MThWR29mZFZkYWNyNm1ZOWFOMFhNY3FjNXp2MUxCcjljT25JbkIy?=
 =?utf-8?B?TzFiWmNRT2xQcm9lUEhPZ0lkNUtUeGdOZ1RLbm5rRXNhQWtVRWU3YXJDOVVP?=
 =?utf-8?Q?WQkkAi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VExUcDZQZlhjVDR6RmdINm91bjM5UCtjTnpiU0tWcG4rcU9CQ2t5c3Iwc3FT?=
 =?utf-8?B?Zm5pTjNYZ3lOQVEwUTlGN1prU3lRWkR3d25nMTI5WlhySHM0aW5IalNnRm15?=
 =?utf-8?B?OHJoQ1NzcG5KV3JSR0VNYlBsc005ZUtMSjZYZGVuZGJSYW5DcFlZN0xLek1J?=
 =?utf-8?B?NjltWGhvUzJocWFQZzE2OWJhenpVUXg3Qm9KL3NJalZLRmUyVXhoVlpjeDk3?=
 =?utf-8?B?cGRQeERGNGtoa01Oc0NhODdBdU45SmQ0VzZYQmpzeHNJSGl1YjhLd2lXWHlq?=
 =?utf-8?B?b2NWZzQyNjlidmJBWCtoMjdCOVBPbGdRUS9NQWxZVTBWb1lJUXhvdDh6VEFN?=
 =?utf-8?B?TzFwZ3NScXBoeGZiT0RCNXVCNWg0S2p0dEN1blZNMUE3N2pscjk4YUZtMS9L?=
 =?utf-8?B?SVdPeTNjczRKOUp6Q0RKNG5ZNlZwV2QxR2o2aEMvOEYzU21CVTB3eWI4T251?=
 =?utf-8?B?bjJIYkoyYnA5eE5GRjh2YWl5UkF0NFFCcVk3Ry9PMk16Sk53SVVadGg0V3NO?=
 =?utf-8?B?VjhPU1JoL090bXcxNWxlbFluWDNtSUEweFd2QjNwL1FWb3hUc09iRXJJeGZP?=
 =?utf-8?B?ckpuN21rMGNnNXdUWExzUFdxdzBNd0ZlelEwdzhscjZiQ29xbjgyajIwK255?=
 =?utf-8?B?RjhPQnliNzl2cDI1NnF4VE4vQjVGQ0FickhNZUZBZmluOHl3ayt1UllKdE43?=
 =?utf-8?B?LzI0S2pobW1GejVTV2hLeE5iY0VNWVZTTjhpSlM0enA3eWYvb25VUXA4V1I1?=
 =?utf-8?B?WjJzSTlIdGNwMkI5STJHckFvbHFuTDAwRmlRSEZ5OFBkRHJTT3I4NzY1T0xv?=
 =?utf-8?B?eWNiOWZTRGhRalVWVlBTQUMrWGdVLzRqaW9tNlBld3pFV3BRN1VEbVBpVldO?=
 =?utf-8?B?ZmV3OVVDWDJFeWxqSWorY0cvZ1pWZW9Sc1Y5d0NFRGFuNVNLOTVwRUg0d0Yz?=
 =?utf-8?B?NU5SMmdCSlNFaUd4RGhxTG5kVkpsaDlmVG5iUUdXQVNJTWhTMDFXblFOeWVi?=
 =?utf-8?B?S1hCa3liNC9SVjFSTHRleFNUcnZnaW9MaTlsUVhyVGtUWDNYR0Eza0NRQkcr?=
 =?utf-8?B?OWRuSkU1S2d4Yit3cE92aWYwaHV5Y0pCV203N2hjUUEyV3dMU1U1MkdKeTFK?=
 =?utf-8?B?eE9raVhMTm9UaTFyOFJlQmxRZzhZWGswKzk2aTM3ZGl0RTkrSTlQYXo4UG9y?=
 =?utf-8?B?cXk4SlVRemg4THVRVGgvTHMvdVBSbUtLVGZQL3oyZ3dROUJxbFRJWG1yMEFJ?=
 =?utf-8?B?QStUYWpnSWk2K3hzbTVsSDJFb1hQZmZRL1o1bDFmL29oblhhUW95MENLNkcy?=
 =?utf-8?B?ak8zZE8ydW0ybTZpbEFHazZuVnJmK21JNTl1ZlY3Z3VwMEE3clVDbE5XYjR5?=
 =?utf-8?B?VmJ2MVJzcCtDcWlOTDdBdVdNVHc1N2lUUXF0UzZCUXhpbVZYeUg3NTdiMUdo?=
 =?utf-8?B?S3NSWWh1M1dzZThJTXc1M0o2Vk42c2RpbHdyd1VEeWFYbEtKREhtay8zTXg5?=
 =?utf-8?B?THFxbnE4Tm9RK3hzdXo3dWxNUkp1TXhYUEQ1bDg3emtobjNwUjBQaHpaN0xD?=
 =?utf-8?B?cmh1d2owbnpwZXdwVEo4VGxmdExhSkEzVmFlVlNrODhPcWN1dFhOclNGbjRC?=
 =?utf-8?B?cjRUK3ZsTUk2ajB0SjRWNmhwaXhjaU1md1RlM1o2YmpsWldxck5iL2tJV1Nj?=
 =?utf-8?B?bnhCNjdNcUowRS9ad1U4UUNydEowc041VDIzazIrVHZhY3lqSmNhbWdpWUd6?=
 =?utf-8?B?RE9qWHovTXZiRkN4TnQrTWNFY00xeEdlLzc2bFZYdnJRTk9vYlJOalRPK005?=
 =?utf-8?B?aFBROVZnRCtLTW54bVlBQXhUNmRoTXJXZHFiRmR1L1l2bWlzVGk3cGtiM0po?=
 =?utf-8?B?RTBhU0c0Z04rdFFDNy9DekV4cHl4YndsTjR3UDRqWGxlVmo4SVZBVlJUQ1pJ?=
 =?utf-8?B?Lzc4SHR2cVVqRnFEVnJQTi9LRXVLS0ozck5TL1BOWlladlFlZmRMU1F4NXdi?=
 =?utf-8?B?cjNJTXM2VzVLUVVUbjVaTGtITlFHZU0rUm5DR2pMWS9hV0d1TGtDTWY2Zzkw?=
 =?utf-8?B?aDZZSHdsSFRiNVZwTVJLNkwrV1ZyNGhmZEdtSjF4eTA2U2xxRExOOG1JanRH?=
 =?utf-8?Q?xXqt0KRty/zILfiDH4qNDcZC3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <741D560FB6F6C045B85090F7B570EE19@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JEGuywfvT8vTES4Pp1ncZEKbxW5FB+R4I5uacUdyPhxCS2UdX7kWI03bSKsgehPZ/jGiBc7nsAgu8I+2Yq2UIXvsxmosUl7J4lHLaZJgALWTYfpqd1oqUUtug9HIVvkj+x7Am+E94/pnAodxPYCI2Pfcbw1d9oC1ZfN3Q7kgXj5uGM+EFG0UtSiK3G2XIQJVuS8OipjseWwWdvvufMu/Fg+SA0y6TCoR49TDUHELogEfhtjEHnaAT3bpWJ63Ca3/wjiJHG6ht0LfpNyidcfiQ/I+9v7MxrR2JlaUKvXO7w8I/zUPgpPQt/0o/jMZ9RzyZ7qbMIXUBAYpfrxxhbOB2HB2yz3GaSXm09R9B11NCkJ6Qbj0Frd4VReCZEcVR1X59/toS1PyCc3iFqoUwD+fXq5CcUjl/dfUA573mP1C5D3AYLZ+8Gl/F5hLNJyFJOsV3tUkqxVeBe0Qthi9McMlH1zGREzK+id0v+O2gUdAnoD8NQvzsrGSxlECZQyk/0oFr3fc6MbuO0hlW5wGFV5cC2EXEHsbmBuyw8nc97nsjxC2vu5/fTGvgvFjNlYZLYIXRsjbmkKrKlyY5wf3MWIb8N1Bf4S4npI8936ffL5I66Wf9rrkuoPsRUsEg5ikAErsKVhAo5CB7ED4j1xPXYxoEQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d90c127-2b17-4720-71bf-08de174ffd9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 01:02:25.7735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZP9OW2tURH96nx0wEZ7TkVT6nD16xWspAm6vwnv6ZHL0p9kHscH/WdbC6PEbuGIkUvR/n4zSlmOlglzR04aUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwNiBTYWx0ZWRfXyXemRnfivg8w
 2p1IfImE6XjOFV1Ki50WxhnfNeX6u6DzOdYVmcXoRjA15id+E6btETWkloyR5d66cGC4z8l/qTs
 2YHhoXumaZqPxYKu7oEh8YwkVFTDH5i57+Wx9Ln0KS/iJIArICD7153b+tqzXa3askobNly3cNO
 vntcnwBogkyyFQ6KYKTLkk2iAyRZFaC1/FOXhyFh/uAHoISZgXINJVpMu0V5g5AelmpyP3E0Fwz
 y9YNt6w0uATP/5UJhHTKiP6pMEoEZ6t8ziYBexwyGLcTcHLlqs724If76QJTkukZZ+3DJrVrHh5
 EveCVCttf1hEDa+cKghoFwV6KbSGoMuf6glISIm7fG8EHaO5ZSQ6dioR+W3NP4mLWTEaaT9mtvd
 p6uhJfqAHNerkALf0MbgzcOtCPs2jQ==
X-Proofpoint-ORIG-GUID: JktAH3rIfUu0c79_QOg2fX_fXTfAdV5S
X-Authority-Analysis: v=2.4 cv=VYf6/Vp9 c=1 sm=1 tr=0 ts=6902b92a cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=1XWaLZrsAAAA:8
 a=6wOUXq8aBhTU44KF-C4A:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: JktAH3rIfUu0c79_QOg2fX_fXTfAdV5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2510300006

T24gRnJpLCBPY3QgMjQsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IE9uIFRodSwgT2N0IDIzLCAy
MDI1IGF0IDM6NDPigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCBPY3QgMTcsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+
ID4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIERXQzMgVVNCIGNvbnRyb2xsZXIgZm91bmQgb24gR29v
Z2xlIFRlbnNvciBHNS4NCj4gPiA+IFRoZSBjb250cm9sbGVyIGZlYXR1cmVzIGR1YWwtcm9sZSBm
dW5jdGlvbmFsaXR5IGFuZCBoaWJlcm5hdGlvbi4NCj4gPiA+DQo+ID4gPiBUaGUgcHJpbWFyeSBm
b2N1cyBpcyBpbXBsZW1lbnRpbmcgaGliZXJuYXRpb24gc3VwcG9ydCBpbiBob3N0IG1vZGUsDQo+
ID4gPiBlbmFibGluZyB0aGUgY29udHJvbGxlciB0byBlbnRlciBhIGxvdy1wb3dlciBzdGF0ZSAo
RDMpLiBUaGlzIGlzDQo+ID4gPiBwYXJ0aWN1bGFybHkgcmVsZXZhbnQgZHVyaW5nIHN5c3RlbSBw
b3dlciBzdGF0ZSB0cmFuc2l0aW9uIGFuZA0KPiA+ID4gcnVudGltZSBwb3dlciBtYW5hZ2VtZW50
IGZvciBwb3dlciBlZmZpY2llbmN5Lg0KPiA+ID4gSGlnaGxpZ2h0czoNCj4gPiA+IC0gQWxpZ24g
c3VzcGVuZCBjYWxsYmFjayB3aXRoIGR3YzNfc3VzcGVuZF9jb21tb24oKSBmb3IgZGVjaWRpbmcN
Cj4gPiA+ICAgYmV0d2VlbiBhIGZ1bGwgdGVhcmRvd24gYW5kIGhpYmVybmF0aW9uIGluIGhvc3Qg
bW9kZS4NCj4gPiA+IC0gSW50ZWdyYXRpb24gd2l0aCBgcHN3YCAocG93ZXIgc3dpdGNoYWJsZSkg
YW5kIGB0b3BgIHBvd2VyIGRvbWFpbnMsDQo+ID4gPiAgIG1hbmFnaW5nIHRoZWlyIHN0YXRlcyBh
bmQgZGV2aWNlIGxpbmtzIHRvIHN1cHBvcnQgaGliZXJuYXRpb24uDQo+ID4gPiAtIEEgbm90aWZp
ZXIgY2FsbGJhY2sgZHdjM19nb29nbGVfdXNiX3Bzd19wZF9ub3RpZmllcigpIGZvcg0KPiA+ID4g
ICBgcHN3YCBwb3dlciBkb21haW4gZXZlbnRzIHRvIG1hbmFnZSBjb250cm9sbGVyIHN0YXRlDQo+
ID4gPiAgIHRyYW5zaXRpb25zIHRvL2Zyb20gRDMuDQo+ID4gPiAtIENvb3JkaW5hdGlvbiBvZiB0
aGUgYG5vbl9zdGlja3lgIHJlc2V0IGR1cmluZyBwb3dlciBzdGF0ZQ0KPiA+ID4gICB0cmFuc2l0
aW9ucywgYXNzZXJ0aW5nIGl0IG9uIEQzIGVudHJ5IGFuZCBkZWFzc2VydGluZyBvbiBEMCBlbnRy
eQ0KPiA+ID4gICBpbiBoaWJlcm5hdGlvbiBzY2VuYXJpby4NCj4gPiA+IC0gSGFuZGxpbmcgb2Yg
aGlnaC1zcGVlZCBhbmQgc3VwZXItc3BlZWQgUE1FIGludGVycnVwdHMNCj4gPiA+ICAgdGhhdCBh
cmUgZ2VuZXJhdGVkIGJ5IHJlbW90ZSB3YWtldXAgZHVyaW5nIGhpYmVybmF0aW9uLg0KPiA+ID4N
Cj4gPiA+IENvLWRldmVsb3BlZC1ieTogSm95IENoYWtyYWJvcnR5IDxqb3ljaGFrckBnb29nbGUu
Y29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm95IENoYWtyYWJvcnR5IDxqb3ljaGFrckBnb29n
bGUuY29tPg0KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBOYXZlZW4gS3VtYXIgPG1ua3VtYXJAZ29v
Z2xlLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5hdmVlbiBLdW1hciA8bW5rdW1hckBnb29n
bGUuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm95IEx1byA8cm95bHVvQGdvb2dsZS5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgICAgICAgfCAgMTAg
Kw0KPiA+ID4gIGRyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICB8ICAgMSArDQo+ID4gPiAg
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5jIHwgNjA4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNjE5IGluc2VydGlvbnMoKykN
Cj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5j
DQo+ID4gPg0KPiA+DQo+ID4gU29ycnksIEkndmUgYmVlbiB0aWVkIHVwIHdpdGggc29tZSBpbnRl
cm5hbCBwcm9qZWN0cyBhbmQgaGF2ZW4ndA0KPiA+IHJldmlld2VkIHRoaXMgaW4gZGV0YWlsIHll
dC4gSSB0aGluayB0aGlzIGNoYW5nZSBkZXNlcnZlIG1vcmUgdGltZSBhbmQNCj4gPiBhdHRlbnRp
b24sIGFuZCB0aHVzIHRoZSBkZWxheS4NCj4gPg0KPiANCj4gTm8gd29ycnksIHRoYW5rcyBmb3Ig
cGF5aW5nIGF0dGVudGlvbiB0byB0aGlzIHBhdGNoIQ0KPiANCj4gPiBPbmUgb2YgdGhlIHRoaW5n
cyB0aGF0IHN0b29kIG91dCBpcyB0aGF0IHlvdSdyZSBhc3N1bWluZyB0aGUgaG9zdA0KPiA+IHN1
c3BlbmQgaXMgYWx3YXlzIGhpYmVybmF0aW9uLiBXaGlsZSBpdCdzIHRydWUgdGhhdCB4aGNpIHN1
c3BlbmQgd291bGQNCj4gPiBnbyB0aHJvdWdoIHRoZSB4aGNpIGhpYmVybmF0aW9uIGZsb3csIGhv
d2V2ZXIsIHRoYXQgbmVlZHMgdG8gY29tbXVuaWNhdGUNCj4gPiB0byB0aGUgZ2x1ZSBkcml2ZXIg
aGVyZS4gRm9yIGV4YW1wbGUsIGlmIHRoZSB4aGNpIGRyaXZlciBpcyBub3QgYm91bmQsDQo+ID4g
YW5kIHRoZSBkZXZpY2UgZ29lcyBpbnRvIHN1c3BlbmQsIHdlIG1heSBnbyB0aHJvdWdoIHRoaXMg
aGliZXJuYXRpb24NCj4gPiBmbG93IHdoZW4gd2Ugc2hvdWxkIG5vdC4gQnV0IG1heWJlIHRoYXQn
cyBhbHJlYWR5IGhhbmRsZT8gSSBuZWVkIHRvDQo+ID4gY2hlY2suDQo+IA0KPiBBY3R1YWxseSB0
aGUgaG9zdCBzdXNwZW5kIGRvZXNuJ3QgYWx3YXlzIGdvIGludG8gaGliZXJuYXRpb24uDQo+IElu
IGR3YzNfZ29vZ2xlX3N1c3BlbmQoKSwgdGhpcyBkcml2ZXIgZm9sbG93cyB0aGUgbG9naWMgaW4N
Cj4gZHdjM19zdXNwZW5kX2NvbW1vbigpIGluIGRldGVybWluaW5nIHdoZXRoZXIgdG8gZG8gYSBm
dWxsIHRlYXINCj4gZG93biBvciBlbnRlciBoaWJlcm5hdGlvbi4NCg0KSWYgd2UgZ28gdGhyb3Vn
aCB0aGUgeGhjaV9zdXNwZW5kKCkgYW5kIHhoY2lfcmVzdW1lKCksIHRoZW4gdGhlcmUgd2lsbA0K
YmUgc2F2aW5nIGFuZCByZXN0b3Jpbmcgb2YgeEhDIHN0YXRlcy4gQW5kIHdoYXQgeW91IHNhaWQg
aXMgdHJ1ZS4gaWYgd2UNCmdvIHRocm91Z2ggdGhlIGR3YzNfY29yZV9leGl0LCB0aGUgc3RhdGVz
IG1heSBiZSBsb3N0IGJlY2F1c2Ugb2YgdGhlIHBoeQ0KdGVhcmRvd24uIE1heWJlIEkgc2hvdWxk
IG5vdCBtaXggdGhlIHRlcm0gaGliZXJuYXRpb24gZm9yIHhoY2kNCnNhdmUvcmVzdG9yZSBzdGF0
ZXMuDQoNCj4gDQo+IHwgc3RhdGljIGludCBkd2MzX3N1c3BlbmRfY29tbW9uKHN0cnVjdCBkd2Mz
ICpkd2MsIHBtX21lc3NhZ2VfdCBtc2cpDQo+IHwgLi4uDQo+IHwgY2FzZSBEV0MzX0dDVExfUFJU
Q0FQX0hPU1Q6DQo+IHwgICBpZiAoIVBNU0dfSVNfQVVUTyhtc2cpICYmICFkZXZpY2VfbWF5X3dh
a2V1cChkd2MtPmRldikpIHsNCj4gfCAgICAgZHdjM19jb3JlX2V4aXQoZHdjKTsNCj4gfCAgICAg
YnJlYWs7DQo+IHwgICB9DQoNCj4gDQo+IFRoZSBnbHVlIGFuZCB0aGUgZHdjMyBjb3JlIGhhdmUg
dG8gYmUgYWxpZ25lZCBoZXJlIGFzIHRoZXJlJ3Mgbm8NCj4gd2F5IHRvIGVudGVyIGhpYmVybmF0
aW9uIGlmIHRoZSBjb3JlIGhhcyBiZWVuIGNvbXBsZXRlbHkgdG9ybiBkb3duLg0KPiBBcyBmb3Ig
eGhjaSwgSSBkb24ndCBzZWUgYW55IGxvZ2ljIHRoYXQncyBjb25kaXRpb25hbCBvbiBoaWJlcm5h
dGlvbg0KPiBzbyBJIGRpZG4ndCBwYXkgbXVjaCBhdHRlbnRpb24gdG8gaXQsIHBsZWFzZSBjb3Jy
ZWN0IG1lIGlmIEknbSB3cm9uZy4NCg0KVGhlcmUncyBubyBjb25kaXRpb25hbCBzYXZlIHN0YXRl
cyBmb3IgeGhjaS4gSXQgYWx3YXlzIHNhdmVzIHN0YXRlcyBvbg0Kc3VzcGVuZC4gQnV0IHRvIHBh
c3MgdGhlIHBvd2VyIHRvIHRoZSBQTVUgYW5kIHRvIHRoZSBzYXZlIGFuZCByZXN0b3JlIG9mDQp0
aGUgc3RpY2t5IHN0YXRlcyB3aGVuIGVudGVyaW5nIEQzLCBJIHRoaW5rIHRoZSBsb2dpYyB5b3Ug
bm90ZWQgdG8gY2hlY2sNCnRoYXQgaXMgZmluZS4NCg0KQlIsDQpUaGluaA0KDQo+IA0KPiA+DQo+
ID4gSW4gYW55IGNhc2UsIHRoZXJlIGFyZSBtdWx0aXBsZSBwbGF5ZXJzICh4aGNpLCB4aGNpLXBs
YXQsIGR3YzMsIGdsdWUpDQo+ID4gaGVyZSwgYW5kIEkgbmVlZCBtb3JlIHRpbWUgdG8gcmV2aWV3
LiBBcHBvbG9naWVzIGlmIHRoaXMgd2lsbCB0YWtlDQo+ID4gbG9uZ2VyIHRoYW4gdXN1YWwuDQo+
ID4NCj4gPiBUaGFua3MsDQo+ID4gVGhpbmgNCj4gDQo+IExvb2tpbmcgZm9yd2FyZCB0byB3b3Jr
aW5nIHdpdGggeW91IHRvIGxhbmQgdGhpcyBwYXRjaC4NCj4gDQo+IFRoYW5rcywNCj4gUm95IEx1
bw==
