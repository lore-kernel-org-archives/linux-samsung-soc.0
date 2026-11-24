Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795561222;
	b=1MuYesjrofDzztMzefAqbXZXJdt77NHXYRh0XGLKWqoTgAIdUvHnrAQdmotFLxIhnIyp
	 8J5q1J18kwmrltWa3rOck1y5kl/KpDxr3nLk1OW6z8T6foWECQAvqy74dpOreXvT2JTP4
	 ccEs40P2k4EURujhxjaMDRmRr8TL6SPqfN6bzNr1NAeZcZp7uZuRwwKwgQmXs7FaZvl7g
	 y0Z+83I7MRPU3QbvduT+VMcchbQwEqurmiwASToEMCSYTDEcvmFeOlyf4aCddAMdIaIdF
	 s0ABgGMun9Phv3SA93R7lUDWbRNfB7k9F9XtegYMDq8lIMw7G1Rm4z9BpAboYSgHZKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561222;
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
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7Bs9+KEnB1mBap1FYI+ev2643BZX75+W6aOvaCRDnUA=;
	b=MAT0XQipQDaD2ax/zbFqEbEUhroQlmOUtJ3FxBqasx1HpAxGKZgat+i/JfEB+/HfeOx/
	 Z3fNFSD/30laCb0xvD7am36L5vyW+Ab6x1ZwKiU/DI6Khz0/9iwowmeX898/WUitwXFId
	 Kf26H4M6d8FVDwCu2CrRKiyqxunDshBBAJ6y7nxHaHXJ2DLVvhvT3FC/L9Eytgp05KOJ3
	 EnE0mLh4f8BTTf/jGW745EOjHxV3t4kKo/ltRS1cetctBWvbQ4hE5OTrce27RJ5eIivd4
	 oAdFGiq0iFmUJa43EpMf2Yf2HkEkHpSMtO5lAl1K675qF9wzfjZP4POuuAHHenAH3Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gWgDsJCQ;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=ZYZ6kByI;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vR4VYHuP;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4132606A327;
	Tue, 24 Nov 2026 23:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4132606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gWgDsJCQ;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=ZYZ6kByI;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vR4VYHuP
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMYO104028984;
	Tue, 24 Nov 2026 14:59:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=7Bs9+KEnB1mBap1FYI+ev2643BZX75+W6aOvaCRDnUA=; b=gWgDsJCQf62b
	BX2nWUq8PWwG0W0CMIPp64yQ42rciolOdzDcbQq+3Z/5XSepM7hXybvl/I7cDlLe
	ghhK45Rb8iYHgG9GqkdDZArmjXK7PZXTHb7LlUGml7doKDwnSbq+6ZLqDuEUa2FB
	caz/YPX7ujQ4ahe4D7sI0lx9CydemYcAtTbbF2l87SVoSH0zSXzaiK11LWzeuvVE
	EnH2hC37MDWexGO2ev3GOhTh4qw0rdUgkUi7VU6fiOPJWlRZLCjBweB9anuV9ogu
	rBaqAS6d9xZT8MQe+wTIlsscweuLYieV2883ZFT739lUY5q5S99AdHNnzHFvrMGT
	jb5iCc0P5g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j5dr12x55-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 14:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795561177; bh=7Bs9+KEnB1mBap1FYI+ev2643BZX75+W6aOvaCRDnUA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZYZ6kByIKq/Zz9VHWNFUjyeMI9N0DHBk4InY4qJKRO9vGHtYnny2+Eq2c1jRbMWfq
	 afTTDyEELgF+zrDoZc8QEfZoX/Fve5kweVRvOAbfjzQskzIZZNeomqj4C8xj3B0mld
	 iYr1b1VG7zvO/ezgm/uvyUx9mzoifgDwY30HOoWeAADfzmzGFDWDOSpSm+6YcENEgU
	 rXFwQ6Jwoox6680Jj7Om4aprKrWza+X7q9WQ/rrYCi5PY73sDvCUttd49P/8pRKLwh
	 yk9hLs5IhFgD37inKW1FnuHUiUQ+EiI7n0QfiKazfAdj7TRuWyW9giO9BCbR+noj/X
	 H7EqIQL016x+A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB1D440158;
	Tue, 24 Nov 2026 22:59:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B0A40A02A0;
	Tue, 24 Nov 2026 22:59:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vR4VYHuP;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7915B40105;
	Tue, 24 Nov 2026 22:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa203EBIqt5bObtH9OPceOds/ZRPQVFf5ON7gp/S5fUlFFV+QN2xk52FeVc+UQS9fITYWAQB3eYqQhKzSvZUv44eC+Wrt5kqgFjN1g04OglCVYoKF/PWRF2qTdkWnSzxXnQ3poL244Oe8OuBQofkZSqbPw6hGkqcj8gmNW2dFYmwv2eEhpJ6uy5HJOYh6Jw1aXqKLx4Q0lrq1jZOIaMXEaesKgk6I+LskK6PHQi2kd89VIG7GKLToSoVl0UugfEoNBwUcxj3+4Plzi5vYQLkOBxGtC8GvJUMR7H/0aHDNhh6j+Jva3nG1d2EP9cD9tHv7vVjNtrhEdZuXhJ0oPdTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Bs9+KEnB1mBap1FYI+ev2643BZX75+W6aOvaCRDnUA=;
 b=i2wBrcKZScVuGQkBJiMQviw8xDE4QInzjBLfX7Tetlo/OldBy2ene6CJX6YkbqEpVspmPrtxsLjm3rNuGnwH638zMQbw9OfRlUnK+issN58z+/iEUy9hYlQotW50SGOHtQ6/BacBVZy5vzwwq73SsNPAHGPtwWmUsItkSn1E2tZjcqWTooiBcL0QPc/DYIUtafIqRzsjr5W8luod8K+BzEGgIPJrvV5t6cdIfmDNMcEiM43pTLfEIM1yVDbhSvYiUOlcaQkSXgjT+2f8L57gxrPTdr88+OI6KkTPJNV1RVdO6ZkGksYUkig3GXTdA48FDgsTndjLPbrBwOLNzofiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Bs9+KEnB1mBap1FYI+ev2643BZX75+W6aOvaCRDnUA=;
 b=vR4VYHuPews7ejqNHffAzJ/Txy3gDTGh+RSoH1vsV9RJt+aBrF/jxDSaOKpsjbeqihoOP0E2dyEV/RwYM+BIS7Ghsb+CQ78wn8hTnesl0cgHhL1Y5JhLPRkrtTOcWZnt5hp+S7QgTrlJY+kNFNR1Z6t41A3Jrba2vR/VVUSlOL4=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 22:59:31 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 22:59:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Frank Li <Frank.Li@nxp.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Peter Griffin <peter.griffin@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
CC: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Neal Gompa <neal@gompa.dev>,
        "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
Thread-Topic: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
Thread-Index: AQHdfGd2jGYyvayJs0ajxyHb8a1L7Q==
Date: Tue, 24 Nov 2026 22:59:31 +0000
Message-ID:
 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|CY8PR12MB7121:EE_
x-ms-office365-filtering-correlation-id: 4aadee8f-0662-4e8c-3c18-08df4a7e9980
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|6133799003|22082099003|3023799007|261009223027099003|10067099003|261026140227099003|56012099006|11063799006|261102123227099003|261021121427099003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info:
 +p+XZ0PgTQcP61DhN3dr2ikW98KrJw+pLoQp149C2WwSHgX3lORCtwa3bOLUAN7pvZLS0e7rfuX4anZ6neRifHPNv5zzAbIEv17IKlYxEsxE2Cin+JI8/G/tygebonsIveJr3jYPOF7zqRSlHSCVy9dvTfXJooaKZjd+KogDSa3Q/BPTrTgZnBEU1D4dUruwBORjTfYvMNhAMEiBnrVoGF3gBlNKt7IhrWP4OhZlXF99ujXlphVCJR1MkiLgfDR7Phon0s9qSoInbDGatXSXiTIedhgiSaYH7sZGVLcv74Imuq8v9yMkIMSgBRLZifjPV3VQgnKyga/dFP6TPm23op1zPM6YeIUtMwAv01xoaslmwJDNDOfCKWbSbqzeiKJUHRqHrJpomK04yxzwWKhrBXEhzSm8eRCBQ+9MBpQ2v+AzBXsgLX+KKul+FUSWn6jhcgmP82d939/2iIULq4DY402i9JDRpKtUQOj6TWQpJnpez6E4NaMwna2CfNU+swJbEVBcsGpmIUaE/yqslHRiBcve1FsnD7FqI88Dny6vw33VZi2Rox0HgQePZEZrPOe0a2KXeumZEsekquk0NlyvYlqCq6LiFhMyO2tGKTMNvzGrxPl8QnRtBl13MJWryZvNEwUBFV7d+RNuORs2AH+G7uCEXgB7uV8XRzhpddjSC2fKg2IxqOQkRrmnDxNeG2I815i3U5jFBMMJE7dWLEd2cwcc4LTVwQizfenzDHPLnTc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(6133799003)(22082099003)(3023799007)(261009223027099003)(10067099003)(261026140227099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VExGUWhFNmZEQVFZMlFSaHIwYm5jMEpoOTk3bXpqUFB0Z200alhJdHI4SFhK?=
 =?utf-8?B?a1pZK2tBdDFVNUlFaHVuSU80WDI3TkJOOVpLOFF0WWVSYVZRY2ptQ1NkdTNM?=
 =?utf-8?B?UmMrN011RGs5b04yb2RSUit6ZDIwR1hyZTNnYmgzRUV2cWVnOG9wb0p5VFRY?=
 =?utf-8?B?cGZteENYQTE4clBNT3NrOG1qenB1cEhjMkpnL3dTcGd1NUUxd0tPd21nNlRw?=
 =?utf-8?B?NTFaMkNaMWcwUVl5a2pYSHMzUmpCbm9iRUt1UENoMzcwanpCaFFqMmtZWVl4?=
 =?utf-8?B?SlA3N3RRY3JpSTNieHFLbHdTMk1tSG9walZOYy82Q0M2V0J6aEFaZUNxUWJ4?=
 =?utf-8?B?SnNIRHpjdmZTU1VpVEdJak05V0tENDhHMjVzMjVvdjhPZklrS0ZMemFMelNE?=
 =?utf-8?B?dE95Y0JIUVhCRVpVQWxQL1cyUDBxOENwdzlvT1NjakU5bWNpWjEwU0xCN2hU?=
 =?utf-8?B?alJHZ3FDNUNoZDRaWE16RW5xdE9LYVk1Mm5PR3lEeE1nWXZSdGR3Yk05d21X?=
 =?utf-8?B?SkxhUElxRWlzUGZZVHZwdXNCNVBzRWs3b2t5YlJpSCtZb0kvWDYyVmwyQUFp?=
 =?utf-8?B?OFh2c0d0OHY2ZmVQM2pHU2xNK1dHYW9veDdqSTZ5TDRlMmtjMXdrL0t5T1RX?=
 =?utf-8?B?YlgvUExHK2c0bTlzMEhpUlI3UmdvSlVoUnp0ZjNuODdxVWFwMGViank1YmZS?=
 =?utf-8?B?alhTOHpMSVlhVTlNeWJPOEgxYnEwOEVSZnB5dDlSUlQyakgwQjlrcUE3Q29D?=
 =?utf-8?B?S2JlNGhjbERlOHMyZEU0cVdIUzN2TFJpZE9BekFKSnQ2SU9xV1JnUVY0OVZC?=
 =?utf-8?B?ZGUveEZKVkdFYjNEcm9JYUplM2dtbVRQRCszVlZORjRPT2ZzdzF3bFd0aE5z?=
 =?utf-8?B?MHRWVjUxd0lRYzBZeWx3RkF1WGpQVlBidS81ODZNN3h2cXFhZEVYSGdkbkNn?=
 =?utf-8?B?SDdLUHR5ZTRQblVaV0kwb3E3Qy9rNmJaK2pTbjg3L3k4MWRyU0JnbGFuNTB1?=
 =?utf-8?B?bDJhTEZIVDQ1c292STJPRGJ6N1UxdWtBczVOZlRDL0Voa0crSUFrT1NoYzBE?=
 =?utf-8?B?T0hma0t5RWtjelZXeTRlOERpMTdqblpUMmF2MFpBQ1VJb1AvbGtEcmpBbTYr?=
 =?utf-8?B?allCaEFkYzJrMnI0S3U4SXNJc0R6YkV6NjE5SCtocDJxZjVFQlZRd0YwaDRj?=
 =?utf-8?B?OWdtZ3lIMVoyMGd2blRZeHhZNGZhV0RYRTc3TSszZkVIa2tSNFQyUzlEVG5y?=
 =?utf-8?B?OG1NQmQybHZJd3JmK1dYbUlnT1Z5eUxmaFd1b21CSUJUODBFN2dTWVlub3ZW?=
 =?utf-8?B?ajlGMkZOUzdhM0lUS2RMa2dTWkdsamMxeGlYUVhPWC9CODdyU290SUcybTNL?=
 =?utf-8?B?V2lQSVZ6NHF0Q0s0eC9SLzhvTzNqVjdLeVVEejRUUVlzdlBYcWtiKzR5WW9q?=
 =?utf-8?B?ZDB3R0JTOUpxa2x0YUYzTVB6MGtFODF0d3BONkR2clNwbVB6TEhrenROSHVu?=
 =?utf-8?B?eGQ3WndwT3NORERyNTNjZTR1V1c4bzFNMkZyWFo4elpvZjB4SWdVRDlXSjI4?=
 =?utf-8?B?bWlDZ1IwZmxlMUUwTjh6TVdZVmRGTC9kYnduSTh1NFdyT01BL3NlZzVYeGgv?=
 =?utf-8?B?V0Z0bkZ5Qk54ejlhRXZGRm02OVpUdXFvS25QZW1jVW12bWVUb2hVRWFrdWts?=
 =?utf-8?B?enBLdmZGSlVpVUlCOWFhQkZuQXlVU3Fka0JKa29PLzBiV09QSGxBdlAyOUhN?=
 =?utf-8?B?ME5pRlhwVXFySkVlYjZTbFlNbjdaK1dmUFhac2cxSHlJU1U4YzFNUTRPR09w?=
 =?utf-8?B?Q2VnVU1FZGhDZ0V2ZFcyUUF1aTJ3dVRUKzV4cm5QTkNUWTlCWmFiZk84UGhL?=
 =?utf-8?B?NkhUYmZmcnJ2ckVNaFMrZlY4YmRpOTZtQ1NSNENOcUdZMW9pcW14QnNnb0lm?=
 =?utf-8?B?Z1RaVWxSMThBeTJWUW96L2R0MVhUU0FCNitHYy9wazlZaHlnelMxbHduNDlB?=
 =?utf-8?B?ZGdVTGlHSjE5MzEzNXZ2NGZ4UUtUSzJVZThaWjg5MEZabG9YRnQxeXJNUXlC?=
 =?utf-8?B?WUc4c21CZ3VJS0twQ0RiMDlsbDFtUEhVNzB4WFFsakp3R1BDdGM5TGd0SFd4?=
 =?utf-8?B?U0wvcjRINWZKOVFJY1k2MkJlT2hWdXdiU3BSZ29rUTFjcWh4aHMySzAyOHpl?=
 =?utf-8?B?OFdGQURUT3IxSjgwbjF2aU5pdVdsUFFaV21pL0hrc0FsdHBVZGpVNG92VUZC?=
 =?utf-8?B?eGcycnZGYmpwTnVDR2orY2xjVjI5M2ZwVTF1bXRZMWgyYVlrQjlseDRIQ0NE?=
 =?utf-8?B?WVhuT2tlSEM2aFVkdW9jdzgrVElxdDF0bm9WdDFtdjRoZzkzSzRTdz09?=
Content-Type: text/plain; charset="utf-8"
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
	adtyrVDbkQgBmCnHBwCsWkrxflzp9rMpvjFi6gQs5tbrvsZP7tBb9UaebNVOdsCk9xuNTgACdQAuMoZnTihi38EdHrFkL2zppLcSSGa2+NBISKfPW1lFhGGApAovxOh+klqEUiLT1KIdXnaqZiEF1ep81c850vyXNR+rRSwFXoSUJZzzL4jXpyvlL2mI8SCZVk22nBTH/ljFTSgQ97f6cyjD5pMmC/7qoOXw9EREQecfZ2WrG55aIOYRUJ/klkDCnwlP/H6fjHC8j4+dOQAjElLeFx/V26PWl89sgbq2WLtiF4oz5iDqx+pRB4MEO7zPD31iGRJc2JDPPCr/UnigiQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cZquXFalHrkrUsKkXob6+eA/OnYY9y9x05pm60o9G90ElJ1VDundboV7mZ8hARY1IBnsPIwgZs+IvDtB/MJ+RGTKv1brRAXZKeFdJ9p+XrwfH10MEDnZa+bceUgwJE8LZN3Iox3ChxK8st/JU8ZI8K39BL3s3pGVzCXftE6xpG9cOE/K33hUd4bk6auK6xxeRwSSAG1LV1m5iV3gufC0VTPIiDnht9tdBYmb2H8UQ5F6wMNQ3LApkkJvvMAPQXL64q9VNzSXDY61Dsah3Wc8vshwTbS8llYr2AesegK3hvULuiXDUxYX11LsPU3IU7Th4iUsSNjHfHS7PVUVAizvTdiAuPtkWeN3EvoATBU0cYS/tNaKJeOLS61/zt1RNCTcr9+6nVc7PW2TQfsMQkJS1Wa4lJ2io1pPuTvQPIlYFrDGcxOsPYPrsXe2PqHwLv8ecdGGwi8eUfElEei5RbYLaI8gbpolZlaU1YyaeeQV+krfZbmhfjUraZFx/xQxR6GLe+lzc9gX02j4aq0znO4FyPcuj3Ria08VbrRDyeyh3HHhcsAw0/qpcjfG9K1ovjoYZLA97GVabR7WayYTZJpOIZ+fgJ5LqmWa3CSV4JoPm1/20gZz1xeaD6ZDMqYuQkL9L1ICQ1jd9+J+TF2dlt8Gfw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aadee8f-0662-4e8c-3c18-08df4a7e9980
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 22:59:31.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMheS+xCbqzNzXqSoadjWmTW3MNuxYw6CuLHgE4udZ7SqWGw1njmGCXoYjEmnkJPfx6w0/H6zRsde1gdJk8CBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX5EAnlPpGqa4P
 J801gkFX/Sg4+rupbkWiJKvg1tbzE2D16pKup41F9IHt1KNoSLcVzvJAGVA8G0tfkhQ+HFWVTMk
 v5CDgT8iWA9KBO3qqyBCMq2ZgV0touKSpUzT9J4xxX321/QJ/hX1aCIqp7rI1FDGKJfqgqaQ62N
 8HeAmIqRh+43YsCdIO2ekuD3ePvAWbcrunj56DBfgUzLci/2R79hXF2r1ZH0Ahdp0WHj2zCiWJc
 3TMMcq7DkaawcI8T1QJ5DWEoRNA/9A/kcv4X2ySP91VcsMwQenuKgy2zZ7ps2Hw6Vetqn7tT6+B
 AcWIgeBbzV/EvumYw03aTiysqrpoqxG3+3uQO1tdvqDYoLDSLRcgQEGc0BZ1iCL8i2TnO9Pm0gX
 DlsnZNS40k2LdWqjiWrBE1zQwxJg7wk8Ee59J2mbfvg+bq0mRTnpUilEJFxGo0BnViR/4Cf3StK
 A0IcHSDpLHor5cZr65A==
X-Proofpoint-ORIG-GUID: BRv-GyjdJAmaoaZc3eAvcytW5N9Wbd1f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfXyA77O6F/H2Oi
 HSSdvphh0+B36SiJnzJ4lP3eiofpwtCbdxoisQYvk7cXn/4bVUrqWwfUsUWnNrPvFhcv3vNVjzB
 nwAHovCCVrbt3/PhhQAhGRGK9qibLEY=
X-Authority-Analysis: v=2.4 cv=NoxE4MdJ c=1 sm=1 tr=0 ts=6b0616da cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=jIQo8A4GAAAA:8 a=6Jvok4ib3PVbS7ZS9tkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BRv-GyjdJAmaoaZc3eAvcytW5N9Wbd1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611240090

c3RydWN0IGR3YzNfcHJvcGVydGllcyBob2xkcyBhbGwgZ2x1ZS1vdmVycmlkYWJsZSBwcm9wZXJ0
aWVzLCBidXQgZ2x1ZQ0KZHJpdmVycyBjYW4gb25seSBzZXQgbmVlZHNfZnVsbF9yZWluaXQgYW5k
IGdzYnVzY2ZnMF9yZXFpbmZvLg0KDQpSZXBsYWNlIHRoZSBwcm9wZXJ0aWVzIHZhbHVlIGluIHN0
cnVjdCBkd2MzX3Byb2JlX2RhdGEgd2l0aCBhDQpmaXh1cF9wcm9wZXJ0aWVzKCkgaG9vay4gVGhl
IGNvcmUgY2FsbHMgaXQgYWZ0ZXIgcmVhZGluZyB0aGUgRFQNCnByb3BlcnRpZXMsIHNvIGdsdWUg
ZHJpdmVycyBjYW4gc2V0IHByb3BlcnRpZXMgdGhhdCBEVCBkb2VzIG5vdA0KcHJvdmlkZSwgb3Ig
b3ZlcnJpZGUgRFQgdmFsdWVzLCBpbmNsdWRpbmcgY2xlYXJpbmcgdGhlbSwgdG8gY29ycmVjdA0K
YnJva2VuIFNvQyBzZXR0aW5ncy4gQ29udmVydCBpbXggYW5kIGxzMTAyOGEgdG8gdGhlIGhvb2su
DQoNClNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgICAgICAgICAgICB8IDE4ICsrKysr
LS0tLS0tLS0tLS0tLQ0KIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1hcHBsZS5jICAgICAgICB8ICAx
IC0NCiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgfCAxOSArKysrKysrKysr
Ky0tLS0tLS0tDQogZHJpdmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5jICAgICAgIHwgIDEgLQ0K
IGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXguYyAgICAgICAgICB8ICA5ICsrKysrKystLQ0KIGRy
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3VzYi9k
d2MzL2dsdWUuaCAgICAgICAgICAgICAgfCAxMCArKysrLS0tLS0tDQogNyBmaWxlcyBjaGFuZ2Vk
LCAyNyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCmluZGV4IDNiMmI1
ZmNjNjI3YS4uMzY5YzljZTlmMWRjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQpAQCAtMTY4NCwyNCArMTY4NCwxNCBA
QCBzdGF0aWMgdm9pZCBkd2MzX2NvcmVfZXhpdF9tb2RlKHN0cnVjdCBkd2MzICpkd2MpDQogCWR3
YzNfc2V0X3BydGNhcChkd2MsIERXQzNfR0NUTF9QUlRDQVBfREVWSUNFLCB0cnVlKTsNCiB9DQog
DQotc3RhdGljIHZvaWQgZHdjM19nZXRfc29mdHdhcmVfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAq
ZHdjLA0KLQkJCQkJIGNvbnN0IHN0cnVjdCBkd2MzX3Byb3BlcnRpZXMgKnByb3BlcnRpZXMpDQor
c3RhdGljIHZvaWQgZHdjM19nZXRfc29mdHdhcmVfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdj
KQ0KIHsNCiAJc3RydWN0IGRldmljZSAqdG1wZGV2Ow0KIAl1MTYgZ3NidXNjZmcwX3JlcWluZm87
DQogCWludCByZXQ7DQogDQotCWlmIChwcm9wZXJ0aWVzLT5uZWVkc19mdWxsX3JlaW5pdCkNCi0J
CWR3Yy0+bmVlZHNfZnVsbF9yZWluaXQgPSB0cnVlOw0KLQ0KIAlkd2MtPmdzYnVzY2ZnMF9yZXFp
bmZvID0gRFdDM19HU0JVU0NGRzBfUkVRSU5GT19VTlNQRUNJRklFRDsNCiANCi0JaWYgKHByb3Bl
cnRpZXMtPmdzYnVzY2ZnMF9yZXFpbmZvICE9DQotCSAgICBEV0MzX0dTQlVTQ0ZHMF9SRVFJTkZP
X1VOU1BFQ0lGSUVEKSB7DQotCQlkd2MtPmdzYnVzY2ZnMF9yZXFpbmZvID0gcHJvcGVydGllcy0+
Z3NidXNjZmcwX3JlcWluZm87DQotCQlyZXR1cm47DQotCX0NCi0NCiAJLyoNCiAJICogSXRlcmF0
ZSBvdmVyIGFsbCBwYXJlbnQgbm9kZXMgZm9yIGZpbmRpbmcgc3dub2RlIHByb3BlcnRpZXMNCiAJ
ICogYW5kIG5vbi1EVCAobm9uLUFCSSkgcHJvcGVydGllcy4NCkBAIC0yMzEwLDcgKzIzMDAsMTAg
QEAgaW50IGR3YzNfY29yZV9wcm9iZShjb25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRh
KQ0KIAlkd2MtPnJlZ3Nfc2l6ZQk9IHJlc291cmNlX3NpemUoJmR3Y19yZXMpOw0KIA0KIAlkd2Mz
X2dldF9wcm9wZXJ0aWVzKGR3Yyk7DQotCWR3YzNfZ2V0X3NvZnR3YXJlX3Byb3BlcnRpZXMoZHdj
LCAmZGF0YS0+cHJvcGVydGllcyk7DQorCWR3YzNfZ2V0X3NvZnR3YXJlX3Byb3BlcnRpZXMoZHdj
KTsNCisNCisJaWYgKGRhdGEtPmZpeHVwX3Byb3BlcnRpZXMpDQorCQlkYXRhLT5maXh1cF9wcm9w
ZXJ0aWVzKGR3YywgJmR3Yy0+cHJvcGVydGllcyk7DQogDQogCWlmIChkd2MtPnN5c2Rldl9pc19w
YXJlbnQpDQogCQlkd2MtPnN5c2RldiA9IGR3Yy0+ZGV2LT5wYXJlbnQ7DQpAQCAtMjQ3MCw3ICsy
NDYzLDYgQEAgc3RhdGljIGludCBkd2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQogDQogCXByb2JlX2RhdGEuZHdjID0gZHdjOw0KIAlwcm9iZV9kYXRhLnJlcyA9IHJlczsN
Ci0JcHJvYmVfZGF0YS5wcm9wZXJ0aWVzID0gRFdDM19ERUZBVUxUX1BST1BFUlRJRVM7DQogDQog
CXJldHVybiBkd2MzX2NvcmVfcHJvYmUoJnByb2JlX2RhdGEpOw0KIH0NCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtYXBwbGUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hcHBs
ZS5jDQppbmRleCAxZjQ3NGE4YmM1OWUuLjgyODlkMjJlNTk5NCAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1hcHBsZS5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtYXBw
bGUuYw0KQEAgLTE4MSw3ICsxODEsNiBAQCBzdGF0aWMgaW50IGR3YzNfYXBwbGVfY29yZV9wcm9i
ZShzdHJ1Y3QgZHdjM19hcHBsZSAqYXBwbGVkd2MpDQogCXByb2JlX2RhdGEucmVzID0gYXBwbGVk
d2MtPm1taW9fcmVzb3VyY2U7DQogCXByb2JlX2RhdGEuaWdub3JlX2Nsb2Nrc19hbmRfcmVzZXRz
ID0gdHJ1ZTsNCiAJcHJvYmVfZGF0YS5za2lwX2NvcmVfaW5pdF9tb2RlID0gdHJ1ZTsNCi0JcHJv
YmVfZGF0YS5wcm9wZXJ0aWVzID0gRFdDM19ERUZBVUxUX1BST1BFUlRJRVM7DQogDQogCXJldCA9
IGR3YzNfY29yZV9wcm9iZSgmcHJvYmVfZGF0YSk7DQogCWlmIChyZXQpDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWdlbmVyaWMtcGxhdC5jDQppbmRleCAzZTkwZGRmMjU4MDkuLjY5YTZhY2Q4NGEwZiAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KKysrIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQpAQCAtMzMsNyArMzMsOCBAQCBzdHJ1
Y3QgZHdjM19nZW5lcmljIHsNCiANCiBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZpZyB7DQogCWlu
dCAoKmluaXQpKHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKTsNCi0Jc3RydWN0IGR3YzNfcHJv
cGVydGllcyBwcm9wZXJ0aWVzOw0KKwl2b2lkICgqZml4dXBfcHJvcGVydGllcykoc3RydWN0IGR3
YzMgKmR3YywNCisJCQkJIHN0cnVjdCBkd2MzX3Byb3BlcnRpZXMgKnByb3BzKTsNCiB9Ow0KIA0K
ICNkZWZpbmUgdG9fZHdjM19nZW5lcmljKGQpIGNvbnRhaW5lcl9vZigoZCksIHN0cnVjdCBkd2Mz
X2dlbmVyaWMsIGR3YykNCkBAIC0xMzcsMTIgKzEzOCwxMCBAQCBzdGF0aWMgaW50IGR3YzNfZ2Vu
ZXJpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlwcm9iZV9kYXRhLmln
bm9yZV9jbG9ja3NfYW5kX3Jlc2V0cyA9IHRydWU7DQogDQogCXBsYXRfY29uZmlnID0gb2ZfZGV2
aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQotCWlmICghcGxhdF9jb25maWcpIHsNCi0JCXByb2Jl
X2RhdGEucHJvcGVydGllcyA9IERXQzNfREVGQVVMVF9QUk9QRVJUSUVTOw0KKwlpZiAoIXBsYXRf
Y29uZmlnKQ0KIAkJZ290byBjb3JlX3Byb2JlOw0KLQl9DQogDQotCXByb2JlX2RhdGEucHJvcGVy
dGllcyA9IHBsYXRfY29uZmlnLT5wcm9wZXJ0aWVzOw0KKwlwcm9iZV9kYXRhLmZpeHVwX3Byb3Bl
cnRpZXMgPSBwbGF0X2NvbmZpZy0+Zml4dXBfcHJvcGVydGllczsNCiAJaWYgKHBsYXRfY29uZmln
LT5pbml0KSB7DQogCQlyZXQgPSBwbGF0X2NvbmZpZy0+aW5pdChkd2MzZyk7DQogCQlpZiAocmV0
KQ0KQEAgLTIyMCwxNiArMjE5LDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBk
d2MzX2dlbmVyaWNfZGV2X3BtX29wcyA9IHsNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IGR3YzNf
Z2VuZXJpY19jb25maWcgc3BhY2VtaXRfazFfZHdjMyA9IHsNCiAJLmluaXQgPSBkd2MzX3NwYWNl
bWl0X2sxX2luaXQsDQotCS5wcm9wZXJ0aWVzID0gRFdDM19ERUZBVUxUX1BST1BFUlRJRVMsDQog
fTsNCiANCitzdGF0aWMgdm9pZCBkd2MzX2xzMTAyOGFfZml4dXBfcHJvcGVydGllcyhzdHJ1Y3Qg
ZHdjMyAqZHdjLA0KKwkJCQkJICBzdHJ1Y3QgZHdjM19wcm9wZXJ0aWVzICpwcm9wcykNCit7DQor
CXByb3BzLT5nc2J1c2NmZzBfcmVxaW5mbyA9IDB4MjIyMjsNCit9DQorDQogc3RhdGljIGNvbnN0
IHN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnIGZzbF9sczEwMjhfZHdjMyA9IHsNCi0JLnByb3Bl
cnRpZXMuZ3NidXNjZmcwX3JlcWluZm8gPSAweDIyMjIsDQorCS5maXh1cF9wcm9wZXJ0aWVzID0g
ZHdjM19sczEwMjhhX2ZpeHVwX3Byb3BlcnRpZXMsDQogfTsNCiANCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGR3YzNfZ2VuZXJpY19jb25maWcgZWljNzcwMF9kd2MzID0gIHsNCiAJLmluaXQgPSBkd2Mz
X2VpYzc3MDBfaW5pdCwNCi0JLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJPUEVSVElFUywN
CiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfZ2VuZXJpY19v
Zl9tYXRjaFtdID0gew0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nb29nbGUu
YyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nb29nbGUuYw0KaW5kZXggNjdlZGE3ZjBkNTI4Li4y
MTNjMDMwNDhhYTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ29vZ2xlLmMN
CisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nb29nbGUuYw0KQEAgLTQ0MCw3ICs0NDAsNiBA
QCBzdGF0aWMgaW50IGR3YzNfZ29vZ2xlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQogCXByb2JlX2RhdGEuZHdjID0gJmdvb2dsZS0+ZHdjOw0KIAlwcm9iZV9kYXRhLnJlcyA9
IHJlczsNCiAJcHJvYmVfZGF0YS5pZ25vcmVfY2xvY2tzX2FuZF9yZXNldHMgPSB0cnVlOw0KLQlw
cm9iZV9kYXRhLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJPUEVSVElFUzsNCiAJcmV0ID0g
ZHdjM19jb3JlX3Byb2JlKCZwcm9iZV9kYXRhKTsNCiAJaWYgKHJldCkgIHsNCiAJCXJldCA9IGRl
dl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gcmVnaXN0ZXIgRFdDMyBDb3JlXG4iKTsN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14LmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtaW14LmMNCmluZGV4IDY0ZGExMjFhOGY3Ni4uMzk2ZDc2MzExMTIwIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteC5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtaW14LmMNCkBAIC0xOTIsNiArMTkyLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29m
dHdhcmVfbm9kZSBkd2MzX2lteF9zd25vZGUgPSB7DQogCS5wcm9wZXJ0aWVzID0gZHdjM19pbXhf
cHJvcGVydGllcywNCiB9Ow0KIA0KK3N0YXRpYyB2b2lkIGR3YzNfaW14X2ZpeHVwX3Byb3BlcnRp
ZXMoc3RydWN0IGR3YzMgKmR3YywNCisJCQkJICAgICAgc3RydWN0IGR3YzNfcHJvcGVydGllcyAq
cHJvcHMpDQorew0KKwlwcm9wcy0+bmVlZHNfZnVsbF9yZWluaXQgPSB0cnVlOw0KK30NCisNCiBz
dGF0aWMgaW50IGR3YzNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQog
ew0KIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsNCkBAIC0yNjUsOCArMjcxLDcg
QEAgc3RhdGljIGludCBkd2MzX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KIA0KIAlwcm9iZV9kYXRhLnJlcyA9IHJlczsNCiAJcHJvYmVfZGF0YS5kd2MgPSBkd2M7DQot
CXByb2JlX2RhdGEucHJvcGVydGllcyA9IERXQzNfREVGQVVMVF9QUk9QRVJUSUVTOw0KLQlwcm9i
ZV9kYXRhLnByb3BlcnRpZXMubmVlZHNfZnVsbF9yZWluaXQgPSB0cnVlOw0KKwlwcm9iZV9kYXRh
LmZpeHVwX3Byb3BlcnRpZXMgPSBkd2MzX2lteF9maXh1cF9wcm9wZXJ0aWVzOw0KIA0KIAlyZXQg
PSBkd2MzX2NvcmVfcHJvYmUoJnByb2JlX2RhdGEpOw0KIAlpZiAocmV0KSB7DQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1x
Y29tLmMNCmluZGV4IDVhNjgwMjVjY2VhNS4uZWYzODMwODAyM2FhIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFj
b20uYw0KQEAgLTc0NSw3ICs3NDUsNiBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlwcm9iZV9kYXRhLmR3YyA9ICZxY29tLT5kd2M7
DQogCXByb2JlX2RhdGEucmVzID0gJnJlczsNCiAJcHJvYmVfZGF0YS5pZ25vcmVfY2xvY2tzX2Fu
ZF9yZXNldHMgPSB0cnVlOw0KLQlwcm9iZV9kYXRhLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRf
UFJPUEVSVElFUzsNCiAJcmV0ID0gZHdjM19jb3JlX3Byb2JlKCZwcm9iZV9kYXRhKTsNCiAJaWYg
KHJldCkgIHsNCiAJCXJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gcmVn
aXN0ZXIgRFdDMyBDb3JlXG4iKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dsdWUu
aCBiL2RyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oDQppbmRleCBiN2NlMTk2ZTg0ZWEuLmU1NmZlZTY4
ZTRiYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oDQorKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2dsdWUuaA0KQEAgLTksMTAgKzksNiBAQA0KICNpbmNsdWRlIDxsaW51eC90eXBl
cy5oPg0KICNpbmNsdWRlICJjb3JlLmgiDQogDQotI2RlZmluZSBEV0MzX0RFRkFVTFRfUFJPUEVS
VElFUyAoKHN0cnVjdCBkd2MzX3Byb3BlcnRpZXMpewkJXA0KLQkuZ3NidXNjZmcwX3JlcWluZm8g
PSBEV0MzX0dTQlVTQ0ZHMF9SRVFJTkZPX1VOU1BFQ0lGSUVELAlcDQotCX0pDQotDQogLyoqDQog
ICogZHdjM19wcm9iZV9kYXRhOiBJbml0aWFsaXphdGlvbiBwYXJhbWV0ZXJzIHBhc3NlZCB0byBk
d2MzX2NvcmVfcHJvYmUoKQ0KICAqIEBkd2M6IFJlZmVyZW5jZSB0byBkd2MzIGNvbnRleHQgc3Ry
dWN0dXJlDQpAQCAtMjEsMTQgKzE3LDE2IEBADQogICoJCWJlIGlnbm9yZWQgYnkgdGhlIERXQzMg
Y29yZSwgYXMgdGhleSBhcmUgbWFuYWdlZCBieSB0aGUgZ2x1ZQ0KICAqIEBza2lwX2NvcmVfaW5p
dF9tb2RlOiBTa2lwIHRoZSBmaW5hbCBpbml0aWFsaXphdGlvbiBvZiB0aGUgdGFyZ2V0IG1vZGUs
IGFzDQogICoJCWl0IG11c3QgYmUgbWFuYWdlZCBieSB0aGUgZ2x1ZQ0KLSAqIEBwcm9wZXJ0aWVz
OiBkd2MzIHNvZnR3YXJlIG1hbmFnZSBwcm9wZXJ0aWVzDQorICogQGZpeHVwX3Byb3BlcnRpZXM6
IG9wdGlvbmFsIGhvb2sgdG8gc2V0IG9yIG92ZXJyaWRlIHByb3BlcnRpZXMgYWZ0ZXINCisgKgkJ
dGhlIGNvcmUgcmVhZHMgdGhlbSBmcm9tIERUDQogICovDQogc3RydWN0IGR3YzNfcHJvYmVfZGF0
YSB7DQogCXN0cnVjdCBkd2MzICpkd2M7DQogCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KIAlib29s
IGlnbm9yZV9jbG9ja3NfYW5kX3Jlc2V0czsNCiAJYm9vbCBza2lwX2NvcmVfaW5pdF9tb2RlOw0K
LQlzdHJ1Y3QgZHdjM19wcm9wZXJ0aWVzIHByb3BlcnRpZXM7DQorCXZvaWQgKCpmaXh1cF9wcm9w
ZXJ0aWVzKShzdHJ1Y3QgZHdjMyAqZHdjLA0KKwkJCQkgc3RydWN0IGR3YzNfcHJvcGVydGllcyAq
cHJvcHMpOw0KIH07DQogDQogLyoqDQotLSANCjIuNTMuMA0K
