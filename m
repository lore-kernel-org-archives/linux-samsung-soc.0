Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2932500CC;
	Mon, 25 Nov 2024 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732565514; cv=fail; b=uhNsWZqlloNjES4c7p0xxlY7NmKB+xbsLsSHh437n45VYPOxghfUBtXvI8AU7CpMYfZPIlBHJHQSlhtpSCckcIEF9F4hM6wg95kkibnljOcfNkXd6ax9Cf1PTMZ9NtL2Ei/AAolgE2n53t/H+3msRH7APHJo6eWwOdmoicffCRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732565514; c=relaxed/simple;
	bh=s9+mBHYnH9q31yTwTJaoygEfwEMCvH1tVQZOu2J5bxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=etdxR7Ztainyiabw1LgMY3In2u2TzlS7iH6QLrCFabEIriQzpe33ENId82IhgOdnAqwtYTLJg2/kZJxafarsohMNrPsuLTiNHaDTqpOxp2QW0670j5LDEZcA545MxIvTknCBhOJqdQpioUIzQA7V0sKIrZtoHXmMMpTo9HORbKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=axoqzmBM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HW6a3ciU; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vwpxQj6f reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="axoqzmBM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HW6a3ciU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vwpxQj6f"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APJ4CKb008696;
	Mon, 25 Nov 2024 12:11:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=s9+mBHYnH9q31yTwTJaoygEfwEMCvH1tVQZOu2J5bxM=; b=
	axoqzmBMhYZc1Rd94mE+I+14i9t6CVm7LCBgZs47r1OYZuzvF3i9iVOM/SnCoWLN
	87oYbHYDJYUBgRiRXQPHpUAoJ/9da2fXD40D1u2SfcZQ1opLj7pkR5AzxaFgzRdp
	vZwN7kewIuSx2MIdXRRW0eIPytiJ1XhG33y1sDjlyKWwkzrZhIoSvRLRVAh59rUv
	0A9iAwgQ3J5PD7QCMMe357mXgd+iZGkrY5DqeWusJK6t1gK9jdLEc+nK4AMCFIs2
	WpnDXeoR7kKmVG5U4lKhPGPLcy+9lObLvmp+VJzdPMz19SDIZbQh9WmYkIhE2oCW
	Xt+d53vW/lfibMUJGX5Q5Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 434ge5vw5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 12:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732565504; bh=s9+mBHYnH9q31yTwTJaoygEfwEMCvH1tVQZOu2J5bxM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=HW6a3ciU76TvZQmQzSOULmHVyDv8H8AUymjobtC8a9gW+5PxGcJfMNDZDKIV8j98u
	 26fIOBTzN18p9DUDdPA8UgpReBlRPNlmwk9r12uMPrTlRPLhHRSKQtT9wdGm9jUN4N
	 CQuD6xUUj3+ytuqTjTshuqiVT0Sd/Ii6fSYca6YEJmWVZvrDKN7r+mDLQNJXV0+rjv
	 ERCntl94GIjH/gihEKo1GRaVDPJ4VnZsp6843zBB7JRKXDZ48Lm2hZPCXEErTwpEWc
	 tOo51Wzg0bVCtqjuMMWhPMhKb+OGt0VLKf+IDOQ7xaEdLXUyIBqb9B/tCs9HRgspa8
	 hJ48BLIRGRA3A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A2C8C40226;
	Mon, 25 Nov 2024 20:11:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4B7E1A0070;
	Mon, 25 Nov 2024 20:11:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vwpxQj6f;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DF834045C;
	Mon, 25 Nov 2024 20:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr+6UboXPyklHLjUAm03B3QfxZE0XI6193sIPpFijgL7x/mXBGxv2N1Y+upT7OMB3ws5o/VzB3nhNWbVd7U3a4ofh+BtiTPBcAN2QRs6O1FATMqX9c/zeRv/K4bbxTX1UmhdtbbQhq9YULTfV3rscp2/p6JXV376waAsL3rg1+bEA5t15cQ+Q4QxtL2EhBR2JlAG8+PHIb4923mcYcwFwTM1Ef/Pd8GLxJikn6lazCMiV+W3Wv/h7Yh0VNpKYCNHVJknQBpzF4Q7SOwxv61JQN0T7QK72EiHE20KW40tJvfSLEVv5fHIOHPlgphpkdkG9dywZP1sV2f+ausl+MQjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9+mBHYnH9q31yTwTJaoygEfwEMCvH1tVQZOu2J5bxM=;
 b=a1+vvzxN35hxMnQwsrrXQnYR4iM6XJHoQ3oCd4NOxiGsginuLDqWK268aFqNwnRVfb1VgamzCAx+a+ygxmdd2BV+yjowFz6UZTZn9mmPqQD0dPoYQB99gu+32FRlBOJDTGNZqsOzL/DmtFHmm8bct9x6bgN2CNcbQBr28KQzdTWDOO8ycUAcQjMitXK18PPRShKAal8UQgCZ3mGpHKLDjdaV7hG/amnRwH5TaqZOVAu80yyhBWLsSZmO1fBKe/bL9Uk9+oax4n+BIkKB48+Dvm/NaULjeV12E1SVZhZwG2F/dvw3atjuu9P+dIHVdTB9Pkkr1XewLywizjQ7RzKuZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9+mBHYnH9q31yTwTJaoygEfwEMCvH1tVQZOu2J5bxM=;
 b=vwpxQj6fnxk8U4xZUbXS9uxqwO3OlaVyHW6f0HDLhs+QF/i7jDRPKc3ibpIfHRTiHA/upWhnt/q7mQOfPxAr4IqPsM82bZI0N2dQsUu8fUuhgihx5mgmpqT6LD50zovghu6Emjhs70ghiaYDhWeKPmn63bPxdNFZ34hXJQSKhwM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7149.namprd12.prod.outlook.com (2603:10b6:806:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 20:11:38 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 20:11:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
Thread-Topic: DWC3 runtime suspend on cable disconnect while UDC is active
Thread-Index:
 AQHa6nSXcGA8h7s8dE6vnyL947IEfLIfjakAgAQoRoCAAh//gICceLEAgAA5AICABo/rgA==
Date: Mon, 25 Nov 2024 20:11:37 +0000
Message-ID: <20241125201135.kmif7pglkhitenfh@synopsys.com>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
 <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
 <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
 <20240813230625.jgkatqstyhcmpezv@synopsys.com>
 <a40ac04beb4501ad95b50f79be3495315e38a880.camel@linaro.org>
 <e40f27c2323077d9b35fac7572f30114b6e33372.camel@linaro.org>
In-Reply-To: <e40f27c2323077d9b35fac7572f30114b6e33372.camel@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7149:EE_
x-ms-office365-filtering-correlation-id: f2470ba4-630d-4dbe-88b7-08dd0d8d5e4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXQ0NTZ5VnIvNFdiQzI1ZWZXVHJQenVPcU1aV2UwYkNJTmN1T3A4Q3FpSS80?=
 =?utf-8?B?ZisrQU9HNHJCNWVlei94aHJUTWs0OHl3cTY3Mk40V0I0MjZlZmI2TnNTVU9E?=
 =?utf-8?B?TzJJd3gxblp1bnB2YmdtRUY2bEpnSVc0ZWR0OVZyT2ZkNUN4YmNMNm1XaTdI?=
 =?utf-8?B?c2JsWWxaSFdwY210Rmh0azRab3FYRDVwZnc4eXRCb0ZtUFArQjdWVHJoRWxy?=
 =?utf-8?B?blVKb2xoWVQxRktXa0JuM0N1b1hSU09qOUU4Z1daSnVkSUFYVmNjcTZCWXBr?=
 =?utf-8?B?dmtISWk4SzdFdVFMeTdXWmgwMUM4Z0VqOGVScUk4VEFKTTZaSmo1SVNua09I?=
 =?utf-8?B?TUV6Q3lodWlYOTQ1aGE1SFhtRlJyWDZkTWR1U3dLZFlGVVcxK2hyWTFKR3ht?=
 =?utf-8?B?QjlEV2cveVRmWXVLS2laRmJ4M2lWYjFMcGdEM2JPNjFLMW1GcXdLcmVLRUN0?=
 =?utf-8?B?UDhpREhIV1Ezd0syckswR2wyTFdkVDZQOXlYR2dZQWp1N3dnWEVJRllkSXE4?=
 =?utf-8?B?T3VWamR5SnJVVGxkWWtXc09HZ1g2SXRNUTFMTHVHWEo0a2JIOTFSL3JpNXNI?=
 =?utf-8?B?ZlZuTXVjT1QyZEFCMHloVXMza1RTTVF5R1R4RlNndncrc2JxZG5tQkpWeEhp?=
 =?utf-8?B?b1VySS96SU1WVm9SNFdaeEJ1MCtBajArSkVvNjVHeGdZOGZ6b3FpUGVXaFpt?=
 =?utf-8?B?a3ZxaUhUMlVyVTJ1aG5wY2ZyekF4dVpJYzhNczEwU005aThQNWFFcmE1bWMz?=
 =?utf-8?B?L0owM3NFUjQ4V2JLWmRBM0U1dTFjRWdycEJrR2NRbDlxYy9mUHhtMS9IMzJB?=
 =?utf-8?B?SVVXK1JxaExrNFdzYlhFWnRmVFFiREk5N0ZiUWZqQ3NPUHEvQmpuTjFLd2NC?=
 =?utf-8?B?czZDb3NONmNqSVk5UGI1UDR1UGNDNUk1OE1MM2tuTlV6THBNNHB6dDQwRXJR?=
 =?utf-8?B?UTBDSVlubTRzY2pERVREZER1WXdEUGxRS2xyZHExZGJlMGJucjI4eVlydkVD?=
 =?utf-8?B?VnhacDY4bHBFTXJOTkdTOFlQNTJGelJnVXFrMk94OEMwVXFxZ0s5b1M1b2Jl?=
 =?utf-8?B?V0dhTGRCMHliaWlhRzhvRDJYQmppVndEUkp2MlJqcjkyRmJEVllpeDVZOVVw?=
 =?utf-8?B?YnBxa0dMZitzb3h3bGlxZUs5VTNCRHc4NDM4NWFNNUhUZmNVUFpIMFgwd1R5?=
 =?utf-8?B?K2FXOHNTbi84SFJMMitQQWtjVUdXelhzNUJtUHozeWh2cDNKUFVLM1RTa0Ra?=
 =?utf-8?B?TDAvWTVMRE9hSkkzbW1WemszYVdsbk40bit1RDlFVkdkMDZDWFBibStUY1ZN?=
 =?utf-8?B?RnJWanZwWGNheFVtRURWV1AvYkhVUWF2MHNJUWdCV0NtaGs2YlpxRmJaSUVj?=
 =?utf-8?B?TnlMZksvSUY0OUUyV3ZWWXJibFVQaW10R2YyNkhKRFRCSklyelRMckRxSGtT?=
 =?utf-8?B?a1AyQlFTMWFaNCtZa0V2Z29rWkJ5elkvcFpRbmhxM1p0QklhdVRBNmlyVnVL?=
 =?utf-8?B?VFBoNE1DdXZCMlZhTWF4L3RmSnZ3T2Zob2dkNXF4Y3RIQU9ONFFSU1BkMlJO?=
 =?utf-8?B?QmFVNTUzUEFhMzlUZkQ4dXVKUVpsa1pydGpxalJUUjhLT29NWDVOd3QrS252?=
 =?utf-8?B?b2lQMnJ4RExEdkEydjRhRVEwckZaeldHYjNhT3BHTVA1SVJMWDU2d3l3djZ2?=
 =?utf-8?B?N2hyYlhaQ3RmbkxvbDZ5bTVJN0RsaFgxc0ZNVlRKd1d5Y3AvWjZMdzV5K2tu?=
 =?utf-8?B?V0lxRjR5RHpaV0VNc1c4WjV6aFBMUzczblpVSStUekdkeHhLbXpTZzZrZ3ZC?=
 =?utf-8?B?eXZrNERiNEQvclZXbzVDcGhxUWFhVHFuNk56K1VDZjhGc3hWZ3hxRjFYbUFU?=
 =?utf-8?B?LytmdUN6UU5VeHVXRndybjE0UFg2ODRMVjdOVm8vWUpxckE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TncwVTczeVN6Mklidy8vYWoxYjZYeVpHNVRJWUtyYWFvSUdCalBnTE8xVWk4?=
 =?utf-8?B?VEhGaUk3TWxzaG9LbUx6blNrbTFkWC9NK0RDdmdUd1BjeTd2aFl0enFwL3Yv?=
 =?utf-8?B?TzFzU3NIYk1uRHhwQ3lCazk5QmUxTnN6ZXdvZ2pOYmM4c1VMSzJRVGU0ai84?=
 =?utf-8?B?WTdveWhOU3JiRDRhOGtjTWNzeHNsNTgzY2tub01YdzA4T1NvcXVhR0RRUGh0?=
 =?utf-8?B?NmxDZTRQM2gyUURNY3pZYS9hYWU4c1BKOXUzdDY4MFBFQ3FDVkszcHlDbkhJ?=
 =?utf-8?B?UWxKRGhRdDBJTUxaNlhJbjJHZFMzekFLN3R2dlpPbXI2dlpPcGdjcjl4enEr?=
 =?utf-8?B?NTlFV0tYSTU5THJITHFlMU00OVJVcjRrZ1diTFJLdEllOEM2VFdld1hSY0lD?=
 =?utf-8?B?cWp5Nlp2WCt4cXU3cnpxdEQwWHgxck1xMkVLak4rWFBMTkJCZEdwdkxRcVBB?=
 =?utf-8?B?NVA1Q2ZVdjk5QnVLMEJWZnVhS3V2T0JIVGhMZ1c4R01xN3RoTEQzK29aWGhS?=
 =?utf-8?B?bkZDdkVNTEEvYjZSU1gwZ0FFT0htTUVQUFhlQmo5dloySmIvS3A4Tk81UDN3?=
 =?utf-8?B?aVg1eGV6RmZZdWMvcWU0alVFSjdFR0tVclVlbUNsTit4OEtuU1U4QWNZUjBP?=
 =?utf-8?B?bi8xOWpwdVd2NnY0VDU2Qkd0N0FDdUlNcXYyT05RdXYxSTU1ZUQ0amxHNEVh?=
 =?utf-8?B?WFkwYlYvRzVaT0kvQ3RkanBZelNCQUxQb3o5bXhhNlI1RW5IK01NUjZmQWM0?=
 =?utf-8?B?QTR2Rzlka2tMajBJb1pGWDY1SWhMWFNWMCtIdzhVeU5lVThhUlZqSGNwUkJ0?=
 =?utf-8?B?WEU4Wm1iMEVxTllwQzVtS2dFTG9BQnhUZHYvU09FSEw2L1N5d3NnYUhYZXlP?=
 =?utf-8?B?dUR0VFo1bkhRcC9XNVVXeE12d09LWUdJMkFCSllCL2N3cGpRQW5xLzM0RGhx?=
 =?utf-8?B?KzhGVG1zWXVHcVJQZjhhbGRHdzBMVzFHaS9TaG9FM1B0eWgyZkVCVERWTDVm?=
 =?utf-8?B?bFNQQTZybVh6bno5TW1tMDVFRTVZWkh1QjYvbUpHOEphUXVpOFVYUHZ4YitL?=
 =?utf-8?B?T0NWNmV1MkJNUWVHNVhISVVxUkZFMWVBRm9WVXNYMXBDVEFOQ1YzRmh2Q3hz?=
 =?utf-8?B?dFlRS2ZPZTdxS2xsSTJqU2JYenBucU90UFQvbjlNTnhjK3lMTER6Y2c3RVFy?=
 =?utf-8?B?RlZOZnNXZE9IdVNNa3BMQ3JCWVErYzNhQlAvb08vbGs1UW5Mc0M3ek1YRCs0?=
 =?utf-8?B?Y01TQWxvOHVrNUI5K3l0OUVBZnBWRkxvVFJZbGVhRnZza213ZEZBZnFBZmhu?=
 =?utf-8?B?aFJKeGJEV0pWbWtEamhLK1E1R0Q2ZkxJVlIyN1N5ZisxcEt0ZS9BbU9rODk4?=
 =?utf-8?B?RzlpSnF3YkhMZHJjZXptdmExZitvN3pGRGZwL3ZMQ3B1cEF3WjVueFp2aFpu?=
 =?utf-8?B?QWtHcC9IWEVhVEpqdTAyc1d0aHZSOFY5aFZHK1NPUjNIdEZ3dDQ4MFcvUXY1?=
 =?utf-8?B?Z0pEOTFEOVNZejZyaERZVzI4NzN0enZPNmFnZUM1bEpubWJ0NzIyWmhnRDZ0?=
 =?utf-8?B?bFR1ZUJzZXNiYnpCeVNraWVPeHk5V0FGL1F1U044Y2JSWk1aS3hBWXZJSzRE?=
 =?utf-8?B?OS9nbTkzZHkwc014b0ozcXBMRU5IRVRKN2FFOEh5Sk9QcXVNb2dDWllYZXRR?=
 =?utf-8?B?ZkZJQ1E3RytPams1WCtqMG9PUE5QK1hva2V2VlRZZEVnN3lFNjN6M1R0eXJR?=
 =?utf-8?B?SG9FL1U4OW53d1NkRzBCUFpXVFAwRkpaQmdmWnhNM1FyOFFFYWJxVUpUWSts?=
 =?utf-8?B?RFpZbXFLUDFvclEzOXFHMVNhN21LQTFvY0wxZjZpQi9qdW5Zc1ZwYWs4L0la?=
 =?utf-8?B?YmtEc21rSWlFc29TZ1FSZmRZRDNDZG1PbVA1WkJObWk1MGUvM0t2Wmk5aVcv?=
 =?utf-8?B?cFMzOFplQk0rVHppSW9UV3J0T09QckpTRVZxOHdjYnFDWUZ0NUl3ZUgvUzIr?=
 =?utf-8?B?RHpMVjN0K0hqUjlLTmZ3SkxSZ1pQK1lUbmg3SG9QMHBCWFF6YnlLTHBVcEw5?=
 =?utf-8?B?MGFDZEVFMkZoWjNkZndmb0dkajNzWlAwSWpuZHFjdThjaVRlY3drYlo1L0Rp?=
 =?utf-8?B?bkQwR3M1Y0c2WG00YlhjTjR5bWtVV0djQUVYQnRYN25GclNCbjYxSyt2ajR6?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97176908A6D28E4FBBB937080362788D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	65+Gq6w9YNd4ltV3VoCNpKY0z0NtpDH/j/ney5BNjiKz3SLhGd9jfcuumg6/WL8xN7BkOxD4KfLkb4H38Wb7qagLV9D+lfDuNv+VjO6lpbEx2pn2Ci8juuZPIpf2TTcQzK+MCppYB2018k3klzjiFWEMnNtHBQ/TA6W+OCeNCtWkqTZEGf0rt5rmD2CQpEItY6FMq1FAXkuf9O90kEszjQriA6dIo8Tr0z8EBHz5QTtoYTSHUIi4vWUI7zj4326bwStU5o5PMh2U2lSGfGth/IpDuQWLaNK0lIs+2mPaP4W/KcN7uCzLvcKJww29gnDCGbknyCi6veA/8sXpR5ExiSvZSFzjlTwyJtNIcE4R17kY6aer1bFtfb9zz0lNfuICPWvn/2cu18ftUBwOacFRR61xt2pQC5s+/TLTfmuI6tHPzRpnwX2XSGhQOIKPFWRHgv13jq+Nyg8mBdiMHtxOaGOl3IjLWlLjduPdIBW/vfV6bc9CxLLhSA4GnMMv0ENn/ubJ/Ojod4yROp50IAkmZQQKFLuG/f/NT0ssKd72xUoSMslyFO8AZKVT4eoht77BDZAVM4rz77DErFjMqDotMCemGAb2e+mRPaiR7PBmEsRfr40xoPJrqt6iEwzQ9zXRCdf6KLAccaLYP2ErHmE4wQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2470ba4-630d-4dbe-88b7-08dd0d8d5e4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 20:11:37.9368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKmbuhg2jJuyN6IaCAspDdHTolMfzktI4V+tSGa2sQu8oZxDZsHEZx0RAp0puu5U4/c0Bzk2us6nU1oUU/9JNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7149
X-Proofpoint-GUID: 6wxkNl1u1GRR-XZRHQk5p2e_nAh3QH0v
X-Proofpoint-ORIG-GUID: 6wxkNl1u1GRR-XZRHQk5p2e_nAh3QH0v
X-Authority-Analysis: v=2.4 cv=F80FdbhN c=1 sm=1 tr=0 ts=6744da01 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=eQpJJLL9KTGeQKuszesA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250168

T24gVGh1LCBOb3YgMjEsIDIwMjQsIEFuZHLDqSBEcmFzemlrIHdyb3RlOg0KPiBPbiBUaHUsIDIw
MjQtMTEtMjEgYXQgMTI6MzQgKzAwMDAsIEFuZHLDqSBEcmFzemlrIHdyb3RlOg0KPiA+IFVuZm9y
dHVuYXRlbHksIHRoaXMgb25seSB3b3JrcyBvbmNlOiBBZnRlciByZXN0b3JpbmcgdGhvc2UgYml0
cyBhbmQNCj4gPiByZWNvbm5lY3RpbmcgdGhlIGNhYmxlLCBVU0IgY29tZXMgdXAgYXMgZXhwZWN0
ZWQsIGJ1dCBhIHN1YnNlcXVlbnQNCj4gPiBkaXNjb25uZWN0IHdpdGggdGhlIHNhbWUgc2VxdWVu
Y2UgYXMgZHVyaW5nIHRoZSBmaXJzdCBkaXNjb25uZWN0IGRvZXNuJ3QNCj4gPiB0cmlnZ2VyIHRo
ZSBEV0MzX0RFVklDRV9FVkVOVF9ESVNDT05ORUNUIGV2ZW50IGFueW1vcmUgKG90aGVycyBzdGls
bA0KPiA+IGhhcHBlbiwNCj4gPiBsaWtlIERXQzNfREVWSUNFX0VWRU5UX1NVU1BFTkQpLg0KPiA+
IA0KPiA+IEtpbmRhIGxvb2tzIHRvIG1lIGxpa2UgZWl0aGVyIEknbSBzdGlsbCBtaXNzaW5nIHNv
bWV0aGluZywgb3IgZS5nLiB0aGUNCj4gPiBldmVudA0KPiA+IGlzIHNvbWVob3cgbWFza2VkLg0K
PiA+IA0KPiA+IEkgYW55Ym9keSBhd2FyZSBvZiBhbnl0aGluZyByZWxhdGVkIGJ5IGFueSBjaGFu
Y2U/DQo+IA0KPiBIbSwgdGhlIG1pc3NpbmcgRFdDM19ERVZJQ0VfRVZFTlRfRElTQ09OTkVDVCBl
dmVudCBjb21lcyB3aGVuIEkgaW5zZXJ0IHRoZQ0KPiBjYWJsZSBhbm90aGVyIHRpbWUsIGkuZS4g
YWZ0ZXIgdGhlIERXQzMgZHJpdmVyIGhhcyByZWNvbmZpZ3VyZWQgZXZlcnl0aGluZw0KPiBhZnRl
ciBjYWJsZSBhdHRhY2guIFRoaXMgdGhyb3dzIGV2ZXJ5dGhpbmcgb2ZmIG9mIGNvdXJzZS4NCj4g
DQo+IExvb2tzIGxpa2Ugc3RpbGwgc29tZXRoaW5nIHdyb25nIGluIHBoeS9kd2MzIGludGVyYWN0
aW9uIGluIHRoZSBFeHlub3MgY2FzZS4NCj4gSSdsbCBkZWJ1ZyBhIGJpdCBtb3JlLg0KPiANCg0K
T2suDQoNCkJSLA0KVGhpbmg=
