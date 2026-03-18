Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967BB2356C6;
	Wed, 18 Mar 2026 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773796504; cv=fail; b=q2deD6RjKL3uH9lCp6/b32QTj2uMegdlVgUEuiTa0KEaF3eoI5ejrhO0TaU3Y0RlJkxN7uBZuej6yjDm2USxr57RUrqiqE0fVKVR7FCXBju7i0XvcmwVVZSZTp8qUmPssJk+rf6dgziGKQtq1dgDDsiassMQp9Vk2muFDlJpxaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773796504; c=relaxed/simple;
	bh=zt7PjgM9s32O5XjkHEmw0AeYK4XSxiKLGDd7qzuTJX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DtBZdPlqkVvMrnQHf2cd0+c/kyeqVjqoOeRwh3F10E5d8pVAbHoKhdANSZRw6AuXA/jYHe9L5wArmXBDnBuCfP/j8tjYVOtYOmYnpRiTgTc2NQjv/dTM6h2RRHslYFyRXp2M/fzETrm0wDzCepUALMiZ7aVSs6LRBZT0G+QkugI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Yx+PGAn+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W2xBZhN1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TNaTjSht reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yx+PGAn+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W2xBZhN1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TNaTjSht"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HLFF063576989;
	Tue, 17 Mar 2026 18:14:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=zt7PjgM9s32O5XjkHEmw0AeYK4XSxiKLGDd7qzuTJX4=; b=
	Yx+PGAn+Qy6GoCkG0X6ws2h9BEOjsKLbEMEUV4WBrrxcWKsjFRAVxcEBjgp4ok8d
	CvBgOgvHzQYKylUxyMUx8jlPN0KevxVb84uXcUxCfpANPFh6jevle/X9++TDq8jv
	tQaEOJY/ZrkSCaM3R2/IxpbinBn4x371JWUrCRvr6Ex9LJzxW5O9dJ/uOeFAak0u
	PInWmV88EOqq3GL83fjuDDBogcV1NXXDqQo0MBg9fYhHiQY8VK3WlgPJiaJb5A6Q
	jp0Xpx+MKgSVGkCJITrTkX74+czofsNxIeq68WRKbwGxhUATgv7bzQ2/q89R4JgR
	+vClZ8XeGOqtsoroKwo9qQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cya43v0t7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 18:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773796461; bh=zt7PjgM9s32O5XjkHEmw0AeYK4XSxiKLGDd7qzuTJX4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W2xBZhN1+h73GaWQYoOX5vsT02EWVd9DgNC2c8dXB0tnbU+yy/WIAHI0n9hQysjhq
	 +i0FEPLjM6uiIZijW4oy30Bawm5UhtWG+859NVr9+SveCT7IXV+pZJbbrTAYvg9z3v
	 rutKbuLINlU8FgNo42Dvd0HgzeAs2AQcbV6EhRRhCrmRRHq3P2YlPrOqkkWCMGRj7d
	 rzeU55dROcIM3BuIvZPxuf31grYXv4DFEWU4PxA7o6mpy7HXq3ovRDEtfcUlHG3NG/
	 PsTGu1zWgEuOtYSE0YU6cK6VLcNRDWZioX/DUyrhdCtqsZnM9Dr99CXOSYuqNqnAop
	 Dnu8HfZAtVj2Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CBA8540B7D;
	Wed, 18 Mar 2026 01:14:19 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 799E6A0072;
	Wed, 18 Mar 2026 01:14:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TNaTjSht;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00602.outbound.protection.outlook.com [40.93.23.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 28BA44063E;
	Wed, 18 Mar 2026 01:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnLBbNdg1Oj+f+l6sUJeopPSBh8puSTFTNlEgBQTv+varnQ9dSsTNT18+3H5Sl9kd3bppRC72WlH5mXxz7YIsDeP58qYAHFHVnyLAmZXM0QDYz/ULHcHJB17nq9MyN2lZiSODsDirf0Ee4I8JN8p2E2CU59XqP1Os8BXLrnRuzy9WMqnXKncARgl/fycISyisr+76bRAYdJ+Sgt2dgmaXckqoc7U/+LAslge0dSClNPkNoiOX4eE0l7yAEmhm8mNfVcg8jFMEZw+2RhyG98pSlu9BU1nJhKp38AOetQdGFA58lfKPB7rjcRXiMBFUq67D+2J+6ne3zUo9REDYdr2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt7PjgM9s32O5XjkHEmw0AeYK4XSxiKLGDd7qzuTJX4=;
 b=S56u3T9pc1qfuVhqIMgHWTCB3i66RMaH6oR8UQAv2CNTH9LuhUzFg01X+8aqhRdYFuuTgYoCYy8AHHPrUIfFDs6ZqBZuZigR0HKy2IIHTnJxkNuIq+5QcMFOuzB2tdDAlRtRU/KSwbByfl6byVHYVI5pEmSlLv/dOg7x44Qp7HWCJ4eyoV/9q31+ZnLuT2J8zAiMrad6EJI/V5dChHlWDNjwPuvZ3fLVk9l5nEwSM4VUFTmgVHhJDZYUj/vN8DQS68T0juEIhPi2vZKapL0ozNQBqJbguutfTj4OWFzihpGWrjvdo/g5zRH63gnXVt7uedPqI6Vc/kTXBQJmFKgs4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt7PjgM9s32O5XjkHEmw0AeYK4XSxiKLGDd7qzuTJX4=;
 b=TNaTjShtuPxDDCaupLiVJx8n4U0Nv05HU7D81ysWAJUErWZ/yy6Y57tKZWJn6BXmpaHEcC5HYqvhV7X1XX4F2TDsQlNxMbE92IVAssBM22MUJysQWpQscwlulgJ+EeBFYtVXwlQE5ZZ7LrEeEBgOV1GKH1uxjEgaFJS+WkAEBBg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Wed, 18 Mar
 2026 01:14:16 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 01:14:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Felix Gu <ustc.gu@gmail.com>
CC: Peter Griffin <peter.griffin@linaro.org>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>,
        Naveen Kumar <mnkumar@google.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dwc3: google: Fix PM domain leak in dwc3_google_probe()
Thread-Topic: [PATCH] dwc3: google: Fix PM domain leak in dwc3_google_probe()
Thread-Index: AQHctVnPvztixkVrLkCxToyVTNxaubWzfl6A
Date: Wed, 18 Mar 2026 01:14:16 +0000
Message-ID: <20260318011415.76ghgdoavxzfsix5@synopsys.com>
References: <20260316-dwc3-google-v1-1-c9bde1b02f62@gmail.com>
In-Reply-To: <20260316-dwc3-google-v1-1-c9bde1b02f62@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4461:EE_
x-ms-office365-filtering-correlation-id: efb6c5c9-99d1-4a74-43c5-08de848bac7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 5ScWsBcDehTmiZfHVqxX3DHKRv3XZqdfZl+IstGcQJiKJ/3T8Wccb7V2l8hvISaLjk2n6R9csUfIF255n43va5zOywA4tsypJZJhbSOqnyv5P0vJFZ976DZSLaYyyA/0BffnSd891qhDjLv882LFB7KnlE5pZy5DESo3Eqpr9nibxtUvlJzKZi1kYbez6DHN8isn+h/a9UaA+/CisLkgxdGv10+yNDob5QWJ5ZrdiEe0GV65A7qtl3hdu5uUjliFKzVUBgsbNMZJTj0u3AIuKQEJUqj3REtJWNrkHD4p/PCrc2SYarKXwJlwd5Sluwa1HZ8E7LLU/7rURjWbwqzcBQlij6Hb9t0ZZet8iOw+JlfYVJgrRxY4XWCz6z3pt1izzGC3Inx+IOdLiJRHw2MS6IBNVtD2bSaqiQkL1Rl8YPbB6ujRh1lIrbC7t3+1IrlA+7GUABGxvk+yqNxuYHQlS/8b1zdSMYmCcnvIUBnAzKInuF9uLLGzUhAvAF4j6VISiUmy2VJfS6gsCrmRHkoayZ/17wEWJE0nOcBMd4/WVZiim0NFtp+i8KydqlchK9SRjyJ9r4OItR4MOGADPe//qPVqZWh4e71eRUtS86j6uqOuiEBte7PzfOv5yMiwcfoUiX4bR7bvUnaSbTJJ1G4Ggky33jKmkRBFVs/0zszRwAdTSohvR8ssayu7FdqRi4MyWaIRBfp/yP5WStxT7E6E+NCIu6rNmDWYmIah+/nHfVHempIrOrkI2uNFsaf2cyBf3V/ZQ3SOXbxaOF+FjiKKQVOzNfGQ0dh4oXTGNXz8JEE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHZaWlIrMmx1U05PL01yb0pLMlgyd2ZOMTIzbFhPN0duejNodkoxZmVMSHkr?=
 =?utf-8?B?RWRxUUZIVUw5aDU1RG9mMWhLZDdqSTJFMll0MmZhSEdEYUwzUGVxSlV5dGpp?=
 =?utf-8?B?aGVuRTZoYUpkVGpHNUxvSXQrWUMrQzF2N20yeUs4dmorUUxXbGtsaFoxWm5z?=
 =?utf-8?B?ZjErVHR2VnlZaUYvcFNnVTQxRm9IMmxTM3k4OSt5bStVbjFEa09aUlNQSWxj?=
 =?utf-8?B?NlNPLzhWNXhXaEVwczM4QmNwRy9ya0hrNExYVGxyYkpZYTBweWw1eGp1Ykw2?=
 =?utf-8?B?YU45ZDkxYnRFdG1samQzZC9IY01VWHYrU1JOUk1FaGlVNUI0UzNoZFkxbHd4?=
 =?utf-8?B?OGRob2l4MlZQRDVpeFBuQ0sxblFQd3RFSVZGekQ2YVlicWxXTTluT2ZZSkxI?=
 =?utf-8?B?QmtvaTJ4QVdVcjVVL2wyU1kyVDRyZHVKTmZqdDRGQjZrZi9kRGZFU0lTQlR2?=
 =?utf-8?B?bDBNOTBWbTN2WFR3ejF0aTJhdkd1a0R2WEZlVXVrNVJ0eENlR1NOWDc4bFRz?=
 =?utf-8?B?NXJDK2xmUSttRjBQYldacmhiVmpTL2dMNTZITEFxRHgrTTk2MjUwa0ltazFs?=
 =?utf-8?B?MHhvQ3BtNkFvNExpT3o2cFVqcWVzcVFMbWtoNWozSk9LWEVHSDhsNkxIcW9a?=
 =?utf-8?B?ZkFqWjJLcGdsVzVMYXBhbWMyZ1lpVFVqZGVtNHg1WmJqb3RGdlp4ZkRZdGpk?=
 =?utf-8?B?a3MwblhNTTZFVzZ1cjdrRDFXSW9YcHVuNUx4VE1yOWxkOXpZU0VHMTVtc25Z?=
 =?utf-8?B?ZnNXY2ZkUklXaHpyRVEwZktRTGpyY245akpZajEvbkYwS3JVek81aFV1ZnZh?=
 =?utf-8?B?UnRndlQ3ejloZjFlMks4YUd2QVlnWnJabWZ2U044ZVhDaU1RZDUzRFZKOHUr?=
 =?utf-8?B?TGVJR1hNY1RDOVNOM1NpSnJRZFJMNk4wZ0pGRkFUVURYYnhsWlFjNFY0WjdK?=
 =?utf-8?B?UGhoQXhWbEs1clAvamx6WXdOcWRuK0hKNFpELzV2cDdNYzgzUW1CRVdpSWFw?=
 =?utf-8?B?Y0F5NHJYb1V6bVRDbVl1cDVnZ3BuUWQ2Sy9LaWV2ZGljNUplUlR6VTFWY1Ft?=
 =?utf-8?B?alMzKzVOZC9KMklqSEVuV25NSHBZT1hCSEI2RGlQdUMrcnM1RWI4cW9sT2pK?=
 =?utf-8?B?N1Y4d2M0TTVVSkt2b1JPd25qaGQ2WmRvMlk2UDdOMGxLTVdENFFMKzF4V3Vn?=
 =?utf-8?B?RmJqOGtBZ3Y2YzJEak1lSFhSOTYyUHB1bjErYWtDV2ltclNRS0gvMHdhNVJU?=
 =?utf-8?B?eExEZUNCYkRKbDN4bm1NY1VjY05tTHUyMW0wRkZldXd5L2ZNVTRnVnljRjNG?=
 =?utf-8?B?aW9SZHljbThHNitWM1YzMkduL1pXd1NrdWpwdFVkT0prOU45L1o5d2p0ZzN6?=
 =?utf-8?B?Y01yazhhWFZiRHdJWDhXbXJwVUxpOTkrTDhzR2IvajJqRmdETWdDMldIcUVm?=
 =?utf-8?B?b3lWczZpVmZjcFJZcGhTek1za0FwM1BWK091VjU2NU1hblE1ZnY1NUdYSjl5?=
 =?utf-8?B?YjhQRVdNaENTNHhCUFdnK0Y1R29EUDVlUVJUVHpIbmhHSEkzV2pid29IbE9m?=
 =?utf-8?B?ZjRZaTkwd0RIV3hxZ2N2d3dVUjRRN2p1dVFRZmRnbEU0Mng4NS9mT0w1M1pD?=
 =?utf-8?B?NVQzeVZHTkVlclh2K0t6NmNxQWk1Mk9PNyt3S2lIQmJ3QVBxMnVUVlo1YmlI?=
 =?utf-8?B?MzNDN3dGYXBabjBNalROUkpXeVMyUGFTdVpoTEQvU0xDUEoxK2xBcnFJclJS?=
 =?utf-8?B?TXAwV1Rud3hhWVBHcXpIWFJrOHBRQTE1TUJGaVhvN01hcnNsZ05ZcEZJRy9q?=
 =?utf-8?B?UHpKUmJodU41WnJiYTlhWlhxTUlLSk5qcHh3WnJETzQxSGwwZmVRQ3JMY3pK?=
 =?utf-8?B?ajZoa2lEbzBMVGR3dUd1dG9yem91M24xS08xKzczcUhuQXJwM1JHbmJ0dlhF?=
 =?utf-8?B?MUdYdmdudllGOE54UU9Kc1JqekcrVUtOOGtJUk55eVZPTlZkd2pncDlQd1li?=
 =?utf-8?B?eU16NTAwaVBFMWl5ZWZPVGowbUovLzE5bm1QV0Eza1ZpNFpPNENKVXFzcVdT?=
 =?utf-8?B?ZzZSbUEySjhJSzgvTFRzdkJ0TExxb2lGVHQ1U0sxcE56Y3ovQjZwMkdFYzdZ?=
 =?utf-8?B?ZUFhYkVQN1hNbFRpZWZwRUR2TmRQbGwxUjg4eFA4VVJLN1FrR2FuVDZuNEZW?=
 =?utf-8?B?Y2ZsbWNiNUtMdjFIZDl0aVhYdmN6dldoWlJJWTZobEkwMUZwL1BBbDl2c2t5?=
 =?utf-8?B?OHJoSS84V3d6K215d1hPNldzYW5MeXRqdnRhUkh3RXhiQStwZHEwSTNINlgy?=
 =?utf-8?B?aDNzZU91cGpjbVlOVHk3S2huNmNhVytiWWRXaGkxdytqKzN1WFZUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <742EC79DA8C4594C8A7AE59F3D6FFC42@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Eu52jgTQIPPmgD2Vs5mUUCjYpllbECghfGx5Ta0IvT3gw6Qcbfcvf5MSDAIUBvh4rrB3t6RlCUmj5EDCVp58u8W9FrfzuSFkzOw+QmkNYHYf26dIjB/PC6OHFTZVgkmw9VBbrhrzE0ab03TQmE5PiqbmR7usvZD1ub1hC/pvrfdzewlAptiU3Sod7KY85ooE+tV5PnWwrhQPR4b/glEQgM+1BHTiq9H8UPqLFgJ9k+Htqkhlb4q8JbY/+1V3YJnG2XO3AaZAbyefgeyOl47u9pmergLRa5Bv79JicQZGA/DGteBL0PmVHwZcic0STrf/Z6KHaHgK6/k2H2u+l15pYw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qz0xfUGeueN+b2DuqrBquvSxhNStd2F0/TG/fyM8p+02DWiruOQ43DT3nhtYzCo81s8n2+DLs7XHSKOdbO7EhFdfa0elN3wa7eubgLYdU70+YKotQgQNo0ORCTDHPc7Zg0SU8Nbq/lSYEGgLtnJu63E5yM1txl4dFo2/LQm0I1DdcyIEsNsoN0dtsFv9r8MkEwuglTTk36sloIUwFJAhniPFm5/DAx7HZxJEPKJsLA3TesUaMuaBz0t74zvKmUrFw00BMTMwkUOZacRyBmGv3Oy1ZVFp5JykuXcBc7Ylb4AHtiemXbpCfP/iYdgqZ/Em29Z0p8yg9fet3lSOtdCIWUtdQpGJNNNi5UkdWh5kD0pfTPGtGFB4YdirN5fVNkzEBb7rlZMaDzW20ioPf+4KGU9JD/6en8G7tYKJFIxmlnCoQ5ORcmyzcAjenncFNEeom1Hs/VMR14o+f1QtJKM6n6oqH7axdxTJJh4QzELJXFnBYRiRn08KSjioDUjE6fI5Fpbz/Jzq1uMyn9Tg9rKufL46Le0/4fsKAxGDxgxA1Eht6fQCmDJLXIKjYxQ98LzjhnKvH0IVv4aIYAgKkjFeipL2GQQETBly9kJdtFk9n84dpZ41+IIXR52jeQs2YATbd7ky+cWBAlICRtf5peHxOg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb6c5c9-99d1-4a74-43c5-08de848bac7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 01:14:16.2179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/M9PH7C1PoWQW8q2Li488o+oENdh2G6b0ZPwaN2Nxeq7F9GSyQfJV9sMLAn77GRGvDFTsp+Ltwh44z5n//H1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
X-Proofpoint-GUID: UuPAn8GGI8d5I_eHIKwAzaOOumjT1ySp
X-Proofpoint-ORIG-GUID: UuPAn8GGI8d5I_eHIKwAzaOOumjT1ySp
X-Authority-Analysis: v=2.4 cv=J++nLQnS c=1 sm=1 tr=0 ts=69b9fc6d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=BdudLDWffNs-h3bHTJkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwOCBTYWx0ZWRfXzWUX0Rme8LT6
 16tO9lWS8dLDsD6nBknItibwidGW5BcyMEyG+C3GWAcoXpZ22MzFEd410Hs3bCeFbL/tRQoe2Vm
 E1XOp3cmur45HL5KR+w/9rPEQTjfUnnIeftXg8vghhPojpkfkXoa3koA3lOm3CkTWxBgL61VGsk
 6r/YlsLelyhrvczEfTjRuf5P/TE5qRgAoATFs8ehdvOGP6k0jZOYH3hSD8TGPljxbKpLbs2lQ7L
 G3c+0x62eJYiiZ7LqeWbz95ldnrXFuWN7seJvsM2+Hzw2UZvDvaL+b6PGql/uX6c/CKKCg0pPbA
 +Nc/qY9oDjh1wNXeXVPzQo6M/jsHJy1BAy+wQVcQll3gAjtumlZjsYryWbka5UZ9ntPiBPUAEAT
 OxYOaWrhLwtUyPoADnuTIq8wTsGsHJ9sYqQzl7ViKmd0x4YSMtcjqI1Tb99TNNVg3WNSZ7wT0yR
 50ejBKaPLxjTVh7lFQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180008

T24gTW9uLCBNYXIgMTYsIDIwMjYsIEZlbGl4IEd1IHdyb3RlOg0KPiBXaGVuIHN5c2Nvbl9yZWdt
YXBfbG9va3VwX2J5X3BoYW5kbGVfYXJncygpIGZhaWxzLCB0aGUgZnVuY3Rpb24gd2FzDQo+IHJl
dHVybmluZyBkaXJlY3RseSB3aXRob3V0IGNsZWFuaW5nIHVwIHRoZSBwb3dlciBkb21haW4gaW5p
dGlhbGl6ZWQNCj4gZWFybGllciBieSBkd2MzX2dvb2dsZV9wbV9kb21haW5faW5pdCgpLg0KPiAN
Cj4gRml4IGJ5IGp1bXBpbmcgdG8gZXJyX2RlaW5pdF9wZG9tIHRvIHByb3Blcmx5IGNsZWFuIHVw
IHJlc291cmNlcy4NCj4gDQo+IEZpeGVzOiA4OTk1YTM3MzcxYmY0ICgidXNiOiBkd2MzOiBBZGQg
R29vZ2xlIFRlbnNvciBTb0MgRFdDMyBnbHVlIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IEZl
bGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3
YzMtZ29vZ2xlLmMgfCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1nb29nbGUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nb29nbGUuYw0KPiBpbmRleCAyMTA1
YzcyYWY3NTMuLjRjYTU2N2VjMDFkMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWdvb2dsZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nb29nbGUuYw0KPiBA
QCAtMzg1LDggKzM4NSw5IEBAIHN0YXRpYyBpbnQgZHdjM19nb29nbGVfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJCQkJCSAgICAgImdvb2dsZSx1c2ItY2ZnLWNzciIs
DQo+ICAJCQkJCQkgICAgIEFSUkFZX1NJWkUoYXJncyksIGFyZ3MpOw0KPiAgCWlmIChJU19FUlIo
Z29vZ2xlLT51c2JfY2ZnX3JlZ21hcCkpIHsNCj4gLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGdvb2dsZS0+dXNiX2NmZ19yZWdtYXApLA0KPiAtCQkJCSAgICAgImludmFsaWQg
dXNiIGNmZyBjc3JcbiIpOw0KPiArCQlyZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihn
b29nbGUtPnVzYl9jZmdfcmVnbWFwKSwNCj4gKwkJCQkgICAgImludmFsaWQgdXNiIGNmZyBjc3Jc
biIpOw0KPiArCQlnb3RvIGVycl9kZWluaXRfcGRvbTsNCj4gIAl9DQo+ICANCj4gIAlnb29nbGUt
Pmhvc3RfY2ZnX29mZnNldCA9IGFyZ3NbMF07DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGI4
NGEwZWJlNDIxY2E1Njk5NWZmNzhiNjYzMDc2NjdiNjJiM2E5MDANCj4gY2hhbmdlLWlkOiAyMDI2
MDMxNi1kd2MzLWdvb2dsZS1mZDYxN2IzZDE5ZjUNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0g
DQo+IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4NCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNCkJSLA0KVGhpbmg=
