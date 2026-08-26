Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09D22579E;
	Wed, 26 Aug 2026 00:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787704612; cv=fail; b=j3NlMSi8UK5JZg1buRfwTSv0qIrBD5F7yWF4BU0LRQLrw28NMP5APmIZ6EAKvANsAJ9iQOpwxrs7ccxdnzOZsDv26ZOi0vRMogrnOkyGoA4b+UzFphcGzFbYiBghFA9rZNwlEPvbZqyMhM/ilUfybEPcQwkbTE8+AotnjiiOfTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787704612; c=relaxed/simple;
	bh=YpPdQlCnLBIS+/LtTHmFbJuquhgCJ87Jd9clVhUk3yc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pgo3A3yPh0B3e+l4yZlfQUPgY84nk6GtVxw/CgisLg7fmK6GyMjd1DoWaWbVYT5jEfXzcCrdLqnXDLpFkO/OaXwOaT0NF3CeBrtm94oQpYY+9diX4JHRTvnRSOtOlQpEVLkonW1m8VwqYNhPeemzLsGVDNLDwAZkQinlZxTdguk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rwtuhzVX; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GuT8AJ9K; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OYszbFTQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rwtuhzVX";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GuT8AJ9K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OYszbFTQ"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q09PBX1004971;
	Tue, 25 Aug 2026 17:36:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YpPdQlCnLBIS+/LtTHmFbJuquhgCJ87Jd9clVhUk3yc=; b=
	rwtuhzVXZJPQloZZnYcFKY8JNl/LNo6J3QuDg+/Kx0lXggqNHwEzmseDkEnjmfV0
	18XyV0uPW1wRCMk4bYZOcoS6WQwtU66OhVRFXC4QRK5XRv1hg8ZenPOQhYEgwSpp
	RdFU000B+5YTrhG0T9xHfD4z1Nh9PS9EtkrIfBIxtWKI7HSk1jeXZKPz/M7c+/mY
	gW/svD8104U9kFA3N96MoflDIo7fdYa7p5Mdlq3oA7NI0wT/aZ1QiN6qIxmYwlJI
	qf8XZoZqsud1HOJU3mbaXgixgKdT1SX80laGwygXe0XFSRcEdPSf2TCrkmzclBqc
	hac1f8rOiZy90bqtVe+Wow==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4g9j5m9e10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787704603; bh=YpPdQlCnLBIS+/LtTHmFbJuquhgCJ87Jd9clVhUk3yc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GuT8AJ9K1XiJ8V7wujbWYMa3aZfj1yCb+LIPbtedGSDu0mYYDLd3ehDerkdVNALk1
	 KSp4xKrP5EmvCFVxUEVws8qkKt/bkbAqpAz6fjB31AE9dSc8iw4o50a7408DGvbUMs
	 ClzKWPWKbhwf0q9I0+Yq3Krv8oxyh+HSGyFvAEXsuX/jjAmLthbew68plhHBpj9Tcn
	 U092TL0LJOlyh1esPutG3hVggA5AjBSH3yUZlZrr7CDqG5AhtI7L+zMwK9O/raJ0ql
	 M0fvtU49yaTSvpFJ4W12zaKin1V/0ugA8FjdR+HdvY9ZfCGjqUaDygQS0ZX7Gsb3HK
	 XZNFp1bJq/atw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A49C04017E;
	Wed, 26 Aug 2026 00:36:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4D855A0B8C;
	Wed, 26 Aug 2026 00:36:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OYszbFTQ;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00102.outbound.protection.outlook.com [40.93.13.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 78B0C4033F;
	Wed, 26 Aug 2026 00:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/O3V/6bIJDyprtEr8DDPg8IuDB1+f/OGfVUq9AEXQb8E+E6oDYNDNRdpL4WRMSE3A0Rfe3CzhXmwetMphLaRTkEDLH0ro9OT68AjSDDzhp4Zmn2jHQ1C2vdUMdPmWY7lT3a5XLz1DqhC7db1MqRM1xTyNWCWSB3oIp/yvaYWcm1Y6TafMHSH9C/Z4LjsgHeHCH3n0p03iTxFBwVb6GmD1Hl0gIIOjRVuh17hd05Ly3O2ygxW+79zYTyKP6welwv4F51L+rru4SzVSE2qQwi8uJsVTxwQimaZeMvdOxMLQb0OtVykLmUU25DNf14yZTfZNIEvZgFPAj85KIQ5PjTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpPdQlCnLBIS+/LtTHmFbJuquhgCJ87Jd9clVhUk3yc=;
 b=SDHWj5dtusERLrWvrp/YPrdAqTL1qDR24vmLE5IPPum5gGeshbgmZUAFYCyBAGMv3Bh6OyVvwyCVut4H4ZutEmBAP6N9zxO3CO/T+c8xbBA/gVjEyaV6VmjeTym6BOVrahQO7L9JBBLAnA4DwIKAn0IM+O9OC7Hly+3+VMo40hwGFzfI0MoEmLBUyagi46W+fZbAL7SVnC7LnUkFy9TScRgJV+22jLWpRn17ptVxodbHBiD634SmMRXXIwuDFB+k0ZiChSMVvqnTZp1Hal7v2ThGtM1JmV7p+L8tv073XjzHsTrFFFV1isxyUFDsistz1l1BbcwU/MJfN5Olta10Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpPdQlCnLBIS+/LtTHmFbJuquhgCJ87Jd9clVhUk3yc=;
 b=OYszbFTQD049PP3xjhwgVQlpQUDhv4GHZH86/xmcXrrETZfqXG45UbMCrFRB80oYzBVveggLpYBhrgAk68BBQbuwdR1zWCteYbBGqiqCqRqmR2w5HUMrEF/EfBZCMu+dOfiXFCZHF8wTjc73AD2EJhXAhqG84mFkOBiGToi/Ct0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB6157.namprd12.prod.outlook.com (2603:10b6:8:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 00:36:29 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 00:36:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: "peter.griffin@linaro.org" <peter.griffin@linaro.org>,
        "andre.draszik@linaro.org" <andre.draszik@linaro.org>,
        "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: google: Initialise probe properties with
 DWC3_DEFAULT_PROPERTIES
Thread-Topic: [PATCH] usb: dwc3: google: Initialise probe properties with
 DWC3_DEFAULT_PROPERTIES
Thread-Index: AQHdMAe+Z80y4w/1eEy9JY7g6oLte7avhc6A
Date: Wed, 26 Aug 2026 00:36:29 +0000
Message-ID: <ao404zOD-rXKZ84C@vbox>
References: <20260819182158.1351869-1-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260819182158.1351869-1-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB6157:EE_
x-ms-office365-filtering-correlation-id: f5045514-36f4-4e9e-9e4c-08df030a120f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|38070700021|3023799007|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 O+BiDMwVcV7bto67iNWtHT78HcNXG1YdRprtitPJgy7CIh6hr6n0SK2E1vvyx0ObVWzhaTbhrHQbiDYfOpTTlSpqv6YikSK44+tLVU6EWO8kpXzqbpO2SPTm1tfP43/DJUu5JdAa4f+F19Onn1MoWR6d0T3VKBvkk0eAI2NW6ZTZ1vc9jABhXaKtegWt/DHRb6a+96QPEyYzKgICYJ075r5MccGU4voNUVehlTMI/OVPxPoSEdj4hupO2cR/87i6WFCm51onqRtwHcBaxPwq56VZ7sxut5vYyRVDxRct7M4CXKJz7eUEfWEoPXoaGfSmAaM6z0KUy/hjsBwPSbQbBhNuIFcDii6sG2kldXu+3PX/q2FvPEn6WQCHRAq4b/L2lGAfbD0TlG1i2IH7hgo2BSv/7ujMwia/8zQjB8CshuBDATGY5iWZP39Xk25DJw6PIcne+GB2d0hOB1g7V+X4M0IKaC2TVQtKV74e/JSSquMvo82ydraLfHm3fI6z3WXPAIrG3TTYCxQ7Bc8tVuA2rzzikIuveEDsU6JKK6cIcWDalv6RczyyoK0RIhl4kZzWa9ZwQ3dodi4L+U69g8TRf+RHgwKP2yS6t46IcmOnTNiuVkzojqVnY3M4tdwXl/3ZMXTqaz6fJgzzSyVlPbEoymRlOYcmxvDr1aosFAe4Kxxr9kprG37IIYphmPQOSuqJOTw1BjlaS7/Vep0hhEdzYJ+bVw16kmzrh/n4sCZIDEg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em53eUdpa2ljbCttZVcxUUJzY3A2a0RLd2g0M2tzZ3ZQMkx2VXRXeTZqVVFy?=
 =?utf-8?B?Z2pvbDRiVUhxTVMzT3JiTG9tZTB4WG9NcG5nSnlCOTA2SHFPL2c3VmZBR1Vt?=
 =?utf-8?B?RjdQUjRCNXhGY3psRTZzWXFVVzhZRWFQakxXNkd2VXc1U0RNcGhhWXhWdlF1?=
 =?utf-8?B?LzNUR2tVOVdQQ0JtbXhxLzNaR3crWWswVmhiME9EZVZjNmxXcUgyMnduV2Rt?=
 =?utf-8?B?UGM4OS8zQ0xBaHB6a053Ykw3WnVvUFdsREE2dTBpTVRLb1Vmb3pTUmtVOGVa?=
 =?utf-8?B?endsM0VuZmRYdUsrRTBnOW1aMnZDd3o2WEtvZEpPVm01TkFTWjF5TXVLYzdW?=
 =?utf-8?B?MU5RNTlMdG5ETElmdG1OZXdCOFpBRDZxdFNzbDRVL0hhWjhmdEU0VFFOOHli?=
 =?utf-8?B?ZmNBRzY3WWd1bzRLWFp0eC9ld29oRzdQVzlCVnhmaWkwSUlhaTZQUFhoSmxr?=
 =?utf-8?B?Smt3YVc4QVVlVVhZRzNING92UnBqUS95SVJvamxlQlJiTkVzVWl6YjIwNE5u?=
 =?utf-8?B?dFpzUEk5MHJsK2FWdEpCTUtzMnJZVEpPeWFOTDlRNmgzSnozcGZRV1dYMktk?=
 =?utf-8?B?QktGNjN5ODdzMUpKQ2ZNeTd4aWR4MlNGS1FyYmNxTFFKSVdGMngzNmsyR2Vr?=
 =?utf-8?B?TmpkT2xkdm5hdGtUV2xQdnQ5WjRneGpJZGVmaWxuam8xTThLdHhVYnZteVNS?=
 =?utf-8?B?NnpLQmw5eGt4akpFQ3M1V2pydXlNTWh1ZUhmNWE2aUx6UGVkcWhocUxaNW5l?=
 =?utf-8?B?RDlNK2FCNFJJMFVnTkhnMVpyWFEzd2dLREJyZ3kzdmZrcG1aY3U4MldLd001?=
 =?utf-8?B?RVRSREJtdGNxc2dSK0ozNVcreFlvU3lSZ0ZHMjhzSHY5SU9tSU5Wck1jYzRH?=
 =?utf-8?B?Yll6Ymw4c3JZeG1ubUp0MmxuUFFDOG9LK1U0QmpUWnhrM2xJRjg2YVZET1dv?=
 =?utf-8?B?bHNzcmNWcmJBSG9wMnovVVMzWFUxZXk4eU1FL2s4T1FDQVhSN2RMSVRZVzZO?=
 =?utf-8?B?bWdaSy9vMEloVU1iV2dXbEtDTGR2dmlUSmdQSzFML0tEU29xTlI2V3JFMTJr?=
 =?utf-8?B?bnJ1c2htaFBJNTBJZzRUelR5RkJMWW5oMkpyTkxmdnMvQW05M0ZiS09Vbngy?=
 =?utf-8?B?alhDdFptR0hvUzF4bmdwbk45SHJtc3dLM0RSZ0JuaTl1a1MrRmdEY21TalhT?=
 =?utf-8?B?UG1wK3NGYmlYTGJxNDZRVTVvZEVUT0liT0NHSDV6Zm85ZTA2L3BnekUwR0lz?=
 =?utf-8?B?WDBQczE5dkdGWU9CbVJkaVF5WEtLYUJRbktNTW5hWHpQU1l6MTdqdTdZYk5G?=
 =?utf-8?B?N2VjN3JzanNXcE50NTVnK2dRLzRyUWE3Q0hGQ09tNjhhbUU3MFB5L2ZnME9C?=
 =?utf-8?B?SnQ0aGJjVEtkeHhRdEd3OTNEZkRJdGZGaHNzckJ0RVd4aCtzd1Npck9mY2VY?=
 =?utf-8?B?V2RHcFRzRUYrVExNNVpOSjd2aGh4cXB1dVQ1Q2trN2wwL0h4VGNPemlLUzVt?=
 =?utf-8?B?L01POVhvTmZCblJHTUlQOHArWHZnUExrbThuNHFuMzdOaU1mTUZGVjNFN3pm?=
 =?utf-8?B?ZUhYNVQ2S2xCa0xLaUZNRGVuUmJWSFc2dnU2OFgzdTZvakM0WWE2RERZN0Mr?=
 =?utf-8?B?MEpKcnV6U0oyQTJVVE8xR3JYMm9zVElrWWdVdEZxUWdZVDFqNDJ6WGFmSnAv?=
 =?utf-8?B?M3BaTVVVQitFZUpBVytmSkVYYzQveUl2cUdaODNNY3BhcEFua0twZnYvTzU2?=
 =?utf-8?B?K1BZRnFNZExoSGNjRTlOMGhxWmtMc1BhMUlqS0ZsSnBhR3l2b1ZwbzNoaU1D?=
 =?utf-8?B?UlBPSGtnOVNaSWROSE5GVWlpTmhIc1BVd2tsNjVrYUsyaGRGaWRkdGF3azlu?=
 =?utf-8?B?N28ycFhCT1h5aE1aL21hTU55SUVXbGsrZGhmb2dDankxZ1BwSEp0N1ljRkta?=
 =?utf-8?B?dVRlOUJsdnhrTHVnQkZOSTU0Q1o5bXdrTkQ4WG1SQXJ2eEp2RTFlQ0VpTVBp?=
 =?utf-8?B?RENyUGlhY3ZSN3hacEQwMVJJV0x2T0tCaTdtOWxiUjE2U2FYUmxDK004S0tW?=
 =?utf-8?B?aEpPTlgrblhDTkczR2FTS3hsdm91aWpQUU8rbW1yWWlkOEZTMm1BdHBxWFdH?=
 =?utf-8?B?YUVxalNhNXJqOHhHQ2JQMnNLQm15K2FZS0tRblVmRnplYXNlTTVub3B4eWpm?=
 =?utf-8?B?THhOK1ZGRzErem1sSVhwdTl6N1hBQTdnVmIxNlNKYmJla0RaczkzNXg0QjYv?=
 =?utf-8?B?cDh0RjFJczYzV1dPaDZGLzl3YWJVN2k4YjR2akhxaVZLVGkxYlA5MFg4clpK?=
 =?utf-8?B?ODc0RzE3dXpoZVlwazAycUdrK3pieUw3ZVFaSEh0RFNGQ3doR1hSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0275DD921170524CA485B6E4D18B5F28@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bp6F3AiUeLK4G/z966m4sDvWNJZissQzHedg+i96xVlSE/gvm3qyrb/+QCevgRpCDE2jvpLMXzfehAah/hrSpkBQSsaRLOaNR4Yrlw/et9GUp6jQS1flIi/KxgMYsh6Jo7QUlmUHKExk7xd8/qr2CDodApIOb5D7w7oZAcq0I56EkOfb6eq+RHNDwVVZ0rHK4DzSqg3OXP5LPVRHV5g1yTqcwBnFOd0rLmCCK2aotS0oNKJhUWQAOdc9zs5wmnifTC/Ww9Lb2YXe8kB/ovGsVsLqOjpFJI1hiGjIlWe0EAyx1RfGPyMwxBe0rsRuHrZbfrUrJsYQUx6igY+OLUWokw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0YF/djyJGS/OLQl98ULl5HkpZnCEe3opXO8g2F0g0kl/KS/JIR9bkTd7627EJqGU/vo/VkjNRybLAB+4slFK1RYWasYSr0tZTbN9tjdQgFNpdoFYm6GJohAwikbKoJPKteVqbZwiAYerCa3Oa9/899l0IVt2hg9Wt7Nul3SaMXVcpYJlhGbboA3lPsY9zgWg6KAKTCX6nz5YdD1sPu7BQE1kDsUn7KEQJOAbSCabosBgHnMOjgCTiNFRAwxKYTa4li8f5BStMGjIkDcTxRJvC261gbDjfDRhLRRWnKxoOXxitp7xmue0uB0aSgw4Ny2xtGuOyxndDoAgcukXMrISpa+5arkjCA+yP/R20SD8C/45XqcZhvYRFX5/YS9UESc22Lop20oQ5tFlHKNen+TToDt6TopDMvWWsyJ4a38K8unbqz6nqwaWN20bMXpYv7EHeMbWM2OoS0ekoE+ePyn6CmzU0Z0d+oRi0a2heSxn14p+sSTCvsiTAPWG+3O/7ZrKZQxEBAIPqYPsAi0EIoJjLX7S4GUhrRQqD1BDz82LoRy0Pdf/IFP0YovuCd3WFB1yWzrsUuOzFc9ttveFxoSTQF7KOuusySKcHEiAlILD2mRFp838EVZmjS8MJL8Q8Wi+VMWMvkLjz3Oo9SowljdKuw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5045514-36f4-4e9e-9e4c-08df030a120f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 00:36:29.7140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xF3FBCZ6iAsc/809gbdErCKq7KigVBPVAOscJDldNIvmpRF6MfdCdmPtw5Si6SaCeExSiHeo0+7N/8wZVo6Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6157
X-Proofpoint-ORIG-GUID: dEs7YtlQl0xz2c8ukxQTVe5WJv5pPKDY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAwMyBTYWx0ZWRfX217zEWZaVZ+p
 lBsjPaZ2SFF8aGSIIkFxHTTmR3Ho4CBRrGBReQMD01RTDZtF6l4GVY2iE8jXLvKntLvfNJ8cQ7H
 dP+6kG+sopSOtge6w1rOXXvzQLzPV/U=
X-Proofpoint-GUID: dEs7YtlQl0xz2c8ukxQTVe5WJv5pPKDY
X-Authority-Analysis: v=2.4 cv=BpetB4X5 c=1 sm=1 tr=0 ts=6a8e351c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=zd2uoN0lAAAA:8 a=48QIdveS5z0wEuqxoFYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAwMyBTYWx0ZWRfX+A5Xz3/jejXA
 Vnomii1bePFBx8grvOUdzRJCCalNd3nGk2EZoVV5g0UWS9CEm8Rs26ZlPy6mhNzexF8JTJ5ponJ
 /Hd6q/LP07KC64OBTPHGRpxbjBZ+dlXNhT9kq9nHaALkfFJhrv0j4rk2ZQPcylW9hi7nBUKDYN0
 2dypL2zToAP13D7UOMdCAwmZN78JzLv3KOES2q9nd/5tu66JhN6zaFz8m7MB4RAasp7USoq0Tl0
 EEcn8IK980+ME7FK8SBDPvUAQKgig+S1fzTAM+jUiQCymGtJr9PBcX+9M/Kwq8ONAcj/WYR6+jO
 AejPIkmrO9cc5koKdEl0wD6r2UfzqTQPA68683yjR1ZsN3G1Hw/8lYgXWsw4hwr11zb8d6IqdPK
 57Vw7XF/y7Ctc7oM3Hb+9eJT7ZmJhjoqX3M9zElCT8u7TDBH31imOEqNIFlCTw7XwWarwQ1v3Dk
 BlO/T45FTCoCgIUAqLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608260003

T24gV2VkLCBBdWcgMTksIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IGR3YzNf
Z29vZ2xlX3Byb2JlKCkgemVybyBpbml0aWFsaXNlcyBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhIGFu
ZCBuZXZlcg0KPiBhc3NpZ25zIGl0cyBwcm9wZXJ0aWVzIG1lbWJlci4gVGhlIHVuc3BlY2lmaWVk
IHN0YXRlIG9mIGdzYnVzY2ZnMF9yZXFpbmZvDQo+IGlzIGVuY29kZWQgYXMgRFdDM19HU0JVU0NG
RzBfUkVRSU5GT19VTlNQRUNJRklFRCAoMHhmZmZmZmZmZiksIG5vdCBhcw0KPiB6ZXJvLCBzbyBk
d2MzX2dldF9zb2Z0d2FyZV9wcm9wZXJ0aWVzKCkgcmVhZHMgdGhlIHplcm9lZCBmaWVsZCBhcyBh
IHZhbHVlDQo+IHRoZSBnbHVlIGV4cGxpY2l0bHkgcmVxdWVzdGVkOg0KPiANCj4gCWlmIChwcm9w
ZXJ0aWVzLT5nc2J1c2NmZzBfcmVxaW5mbyAhPQ0KPiAJICAgIERXQzNfR1NCVVNDRkcwX1JFUUlO
Rk9fVU5TUEVDSUZJRUQpIHsNCj4gCQlkd2MtPmdzYnVzY2ZnMF9yZXFpbmZvID0gcHJvcGVydGll
cy0+Z3NidXNjZmcwX3JlcWluZm87DQo+IAkJcmV0dXJuOw0KPiAJfQ0KPiANCj4gVHdvIHRoaW5n
cyBmb2xsb3cuIGR3YzNfY29uZmlnX3NvY19idXMoKSBwcm9ncmFtcyBHU0JVU0NGRzAuUkVRSU5G
TyB3aXRoDQo+IHplcm8gb24gaGFyZHdhcmUgdGhhdCBuZXZlciBhc2tlZCBmb3IgaXQsIGFuZCB0
aGUgZWFybHkgcmV0dXJuIHNraXBzIHRoZQ0KPiB3YWxrIG92ZXIgdGhlIHBhcmVudCBkZXZpY2Vz
LCBzbyBhIHN3bm9kZSBvciBkZXZpY2UgdHJlZSBzdXBwbGllZA0KPiBzbnBzLGdzYnVzY2ZnMC1y
ZXFpbmZvIHdvdWxkIGJlIGlnbm9yZWQuDQo+IA0KPiBBc3NpZ24gRFdDM19ERUZBVUxUX1BST1BF
UlRJRVMgc28gdGhlIHVuc2V0IGZpZWxkcyBjYXJyeSB0aGVpciB1bnNwZWNpZmllZA0KPiBzZW50
aW5lbHMgYW5kIHRoZSBjb250cm9sbGVyIGlzIGxlZnQgYWxvbmUuDQo+IA0KPiBGaXhlczogODk5
NWEzNzM3MWJmICgidXNiOiBkd2MzOiBBZGQgR29vZ2xlIFRlbnNvciBTb0MgRFdDMyBnbHVlIGRy
aXZlciIpDQoNCkRvZXMgdGhpcyBuZWVkIENjIHN0YWJsZT8NCg0KUmVnYXJkbGVzcywNCkFja2Vk
LWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywN
ClRoaW5oDQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXku
c2h5YW0ucGFuZGV5QGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWdv
b2dsZS5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ29vZ2xlLmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtZ29vZ2xlLmMNCj4gaW5kZXggNjBlZTRjYzk5YjI4Li5hMDFjYTIzY2I2YTggMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nb29nbGUuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtZ29vZ2xlLmMNCj4gQEAgLTQ0Miw2ICs0NDIsNyBAQCBzdGF0aWMg
aW50IGR3YzNfZ29vZ2xlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJ
cHJvYmVfZGF0YS5kd2MgPSAmZ29vZ2xlLT5kd2M7DQo+ICAJcHJvYmVfZGF0YS5yZXMgPSByZXM7
DQo+ICAJcHJvYmVfZGF0YS5pZ25vcmVfY2xvY2tzX2FuZF9yZXNldHMgPSB0cnVlOw0KPiArCXBy
b2JlX2RhdGEucHJvcGVydGllcyA9IERXQzNfREVGQVVMVF9QUk9QRVJUSUVTOw0KPiAgCXJldCA9
IGR3YzNfY29yZV9wcm9iZSgmcHJvYmVfZGF0YSk7DQo+ICAJaWYgKHJldCkgIHsNCj4gIAkJcmV0
ID0gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byByZWdpc3RlciBEV0MzIENvcmVc
biIpOw0KPiANCj4gYmFzZS1jb21taXQ6IDZhNzQ2Y2QyNjVhZWQ1OTEwN2ViZGFhOWNlMDM5YmI4
MzI5MjI5NjkNCj4gLS0gDQo+IDIuNDMuMA0KPiA=
