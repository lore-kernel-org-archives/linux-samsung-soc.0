Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795561218;
	b=MiDnBhYiBWoAe/tc/Ukf6rOozgYYQQbz3nWvEKtEis1CE5abP527VgtJklWT3Ix1gNGv
	 3wvc3VfhD9wM7c5gcZaPqiDtszaKk/hSkERZrzCeVISReCqwH+WEomJ+IEnoH1E+8OE3n
	 lf6Guu1qYOFVE0+/wOAuDZxWOl2oaqzRoGVCqysYR9y6WRqd5fx0X1JincxvSUHmlSBx6
	 YQKZAX+qasId6Za6bL3XfJaxw2pWTL4nm6+BhKsYZ3y3EvfJqJs1y89JrAUOlnJaDQs25
	 SdfmmAsyLQUqQdCwsKntWQ/breGiMBpNzBMVqyMWgfcQwGIH1Q9a7/DlBCsiX4zj/xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
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
	bh=9MHvbdYdgNtKaaelokXaWnJYXkNxX7EhZvHYqt4n+MM=;
	b=KeGzbvl3Itns+Bajd3zCsbq6qcXsRtccLDqlMDFpzDnvPbq2MmGinuRFsz5zAV0zbbLY
	 ppC99TL87CxPU4t+Wvuui9M0zEKoRJ6umfUnYwLffbdrIdyoJS12eah2xPirXI+42xdZa
	 b1khLANi+yF+yMxCKIwQBwSLYxoX1BkwB28yp2c1W8O/ycT7o8/z+dj6Er1IGT6O5792p
	 goJ89KKAjRpTBQZkG6Bz1s6uzmp99sScnzoZISAkY7wPLvcW0mNWc5oRQTZK29SsIJj3r
	 XQCXnk5zk564mrpId2bT+88Im0L3hd3/tVTIDcFB/Y0giQ7BBrWkwKyiNkfr3IuwEgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=RpKz0QrS;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=hKnFK7hK;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WeRLU7kJ;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF99606A696;
	Tue, 24 Nov 2026 23:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF99606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=RpKz0QrS;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=hKnFK7hK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WeRLU7kJ
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMYOap4028960;
	Tue, 24 Nov 2026 14:59:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=9MHvbdYdgNtKaaelokX
	aWnJYXkNxX7EhZvHYqt4n+MM=; b=RpKz0QrSweFncCyZTbhUaQJz9exYHqfSlfV
	lrJaqZ7hQh2SU5GBXsx6pkU16zR0pSarHlKTUqx8KbgVweabvP1Vqh6/NB+LtEvr
	sixCn+skWtMwYVHKUIMHgt3Ix35dVpg7kmp0tX1E4FdNG4HSl4FpYk5Kx8EjH//t
	gncaQcysv3pEHlk2RtQlQylmMZtbb1HQN/XuQtyVPvlAPgUPcmNAQKHqjGr+9K57
	uzRKiCK52oM0AXCtZvYGrl2tFimWsdem8MsNt514muBduRc0CeCcqRAvXMYQeXXx
	+ZFnPGFI2T3cVoqxZjfFBqZuvrRWEUY8OToz9QPMa0UXYDOBpOQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4j5dr12x40-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 14:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795561166; bh=9MHvbdYdgNtKaaelokXaWnJYXkNxX7EhZvHYqt4n+MM=;
	h=From:To:CC:Subject:Date:From;
	b=hKnFK7hK9w2p6kr6gEO7HzZqAAWr4ZfstPAh5WDTS0sGCjyWZRRzbiSk42kooNCaq
	 9LTnBRulBkRhuF2tsxBk5jJkOtlLSUYMQOO28425fFgOUIeN0R2WcnP8kR2oKpTFrl
	 A2GCAM71SvbmhT6rDpcuT59wP+zZsDZ9Rn/czYK5kKOv90iVAuyGjHmp/Zz+WL0oea
	 oG0/JGM/mNXNlWSe2+Ds1Amf4ZOVxU+cP3W8xIRRS1Hzm86s5rJCkgyak7QdVc6+MX
	 LUg4Wiclc75EPtrM6SOLVXR1RUv/Po9jijoHRjPjICReMwAZ7CxbVetadog06I9coz
	 xXnOyEfGwumWg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8CCC5403FC;
	Tue, 24 Nov 2026 22:59:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A3BD4A075D;
	Tue, 24 Nov 2026 22:59:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WeRLU7kJ;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00106.outbound.protection.outlook.com [40.93.14.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D5F78401D5;
	Tue, 24 Nov 2026 22:59:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InIJ6Li+3U4X9NJSbCz1ykFSSBB30nzaxJFXigJ7LZBiT01ajuw37eiX7H0cV2TLJ6oKW4BPPixzG5/cMp1hENiNglri9Gwhh9XSyBxYrrb1SzLZq4v6NBXNEVYDv94ldefAqwqaVSTT0mdrau2pYWN4xUIVM3X29w6zBAxCr5qJHbEZVF8Qtyuo0lQv9lzk8ar45Gqo4o7s/TM9WC2nn0AN80Lqppus8gbYf7jlUVz50JhqUFXlBUn82giJEIVpZpn/7CxS9vKcGQ/h7IFvE3kfjYTwOGdJF5VKLKHRxBDibO9l9W0Nw6HqprkibLazzi9xzDpHxyyrG+nAqZ+BYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MHvbdYdgNtKaaelokXaWnJYXkNxX7EhZvHYqt4n+MM=;
 b=VAEt6Dh71UjG3lggqCItwAkw8jRoEuPrUfTw17FEYwxvyXhxdRIvcvcFmnrpvHJon8+gPOREH8RbI4OuqnJQDuE1cjwBdhKFoSNb8ODtY8eUa/c11w9qphvJ3CvbOp/J4C+I/npCg/DStAMnsf1rfm7V+7kqvdsCc4pGdM0j4vLy+Xpy3AQS8L0bm8swVT4+5zJB3hZzkdosqyI5lzfQVO1BjRawA/i+GeyN3fubSTD0JApKbdLpkks34ZXtjt+NXUmHrMjl0zvoPTPeIoPcYBBWw06j47eC7d3/6SbW4zIY+KX4FYBJavcFykhtjEdRLLFL8d6b9zLAPVV5DiEzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MHvbdYdgNtKaaelokXaWnJYXkNxX7EhZvHYqt4n+MM=;
 b=WeRLU7kJF+0xR/y1iAA8wtdRnE1u6rlzqfLuv1ilS0wrfTeN8TGJB6D5QGzqMsP1dhvKzzzx+NvtlV4FOvyx0+ZD49T/nqdWXTisJTELQNXKqFXRdhVCAMrVYpkf+HFMOuCA1UVsiHK8qbCWiK0nwgV1bTbduH/X3FrPoWZH6X0=
Received: from DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 22:59:14 +0000
Received: from DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4]) by DS7PR12MB9525.namprd12.prod.outlook.com
 ([fe80::4125:6ab7:5608:96c4%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 22:59:13 +0000
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
Subject: [PATCH 0/3] usb: dwc3: Let glue drivers override all dwc3 properties
Thread-Topic: [PATCH 0/3] usb: dwc3: Let glue drivers override all dwc3
 properties
Thread-Index: AQHdfGdsHeidBYV59Ui+aMiQbfeKlg==
Date: Tue, 24 Nov 2026 22:59:13 +0000
Message-ID: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9525:EE_|CY8PR12MB7121:EE_
x-ms-office365-filtering-correlation-id: 1b13a6a4-e18a-4c0d-b045-08df4a7e8ee5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|6133799003|3023799007|261009223027099003|10067099003|261026140227099003|261022075727099003|56012099006|11063799006|261102123227099003|261021121427099003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info:
 JzByHi1Sjcj6YLXUc4bZkJdTt0Aezpi5LEvkyc3OlsYeSoOYDzcDiaViqytTUDLlZqyzB/g6663VpE82O6cFoWwL0DTKOblNtwcl2pLo5payINC6FWI4nu8DhIB6AD54T8JZ/NO+vaxFPRi6bdSdw4l1ZOKJnZe5rme0LEpN5tlmO/rzkl9PXBftpreZD/OjOtxZnoGdfu2edvsxKM6PbNcdOITIWizXqlhgD2jezv1bjamDkOqogHVZi395U635pjQeywTEloCAUdCEWE9QIHSV7x0T9jzbM6WmwdNNB6tBs3HJ2SBrPcwKa0Gc33G/HrZSm1JEmm4YpF2BD0hiYRMW0sUSe/of5wVqTTIL6ytTE5ZnbplQMkxrPEcbSwk+iu0icnNHPwJvUYBWJfHLj/qRSoMp08nWPu86LoMZt/zfC3xYfccioGS0r4tFFPE43Y+khwVi1EDvrhDmO1okR3ARX76wfhTVyefCE5F0939VnI8VdkqQtZpvvL7vLytBIE79nUaylwIT7iXCee/XhaEFrwNnHfZrHRvb/RoHkJYcmCs0TTZ319T2k2jO9A3qOgMTG7X0riSM65TFlB7oiJnqZYD4c0hbiFpfsZCxfo5FSBqaDjeOrmZO1rSU/b9NFS5aoAaKYnt0xLkz3idt6JttX421PH8u5e2Pzi4ay+/XO1cOIi9U6Bv1xqtM8QH+afXCdWw8fsL5VPlBpcRCv5hnfY69EIz2kX5VnI6IcUI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9525.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(6133799003)(3023799007)(261009223027099003)(10067099003)(261026140227099003)(261022075727099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U1RxWFBzbWNETHFrcFZLVnRrYUVrVzRZc09mTTkyYlo5WVFNcW9XYzJoMER3?=
 =?utf-8?B?LzJ5YWFyM2I0MXpBdlArRDdyK1E2djR0TWhxWTZDK1NBTlVRRzF1dmhlNkZ1?=
 =?utf-8?B?QUliMTMyNGJjbGx0a1lzS2s5eVBrS0pKTGJGY01WQ3d4eVdQUStwdmpqYlND?=
 =?utf-8?B?RXJrUFFCc2xLcGZEc25rTGd1L2JrNUdHZkNhd1pCb2ZaQVF3SmFXSjQwcFdN?=
 =?utf-8?B?Vlk5SDVVei9TRXdqUTh5QUNqc1M1eWRUbGVqQ3pWanJFRDdUb0Iyb1pUNTVw?=
 =?utf-8?B?azlsd050RjAwcXdVb1dIb05Rcy8vdExjc3JNV25MZEs3MnJoczRUbEJPaEox?=
 =?utf-8?B?QzVSVmhQclhMNUlFR2hNTHJ4dXQ1OUZJSW82TXhuR0dDN0xWdHZXTVh6RXZZ?=
 =?utf-8?B?VFJZWkZ0ZkFJd1JQSlRUQW1tbTRPTEE3MlhOUTg0VnpndWxhUkdReHhaL3RK?=
 =?utf-8?B?RFlUK3A4b0krR3JPVnJJbE43NVk0QWFvbEQ2elk2TGtTOU1PZkd5V3dZcFpY?=
 =?utf-8?B?WWc2LzVJcXlSSGhmNUN1czg3TjdrbjFWdTg2L2FLWFQ1L2tocm9GZUxXYVc0?=
 =?utf-8?B?T3JBZXVJQUVhR2xSU2I4UFRlR080blpJV051ZmdSeFdweDQ1bnl3VGJzU2Qz?=
 =?utf-8?B?YytYZFc4QXc0dVAzZVB5em1IaXBSUTdpaDZRYVY4Z2Fha20vZzc5V3ArNER4?=
 =?utf-8?B?RnMrdE1sN1NLNFA4K3RGWmFQaFR6aDlQbHRiRW5vK3lSM0Vxbkw0ZnFPWHhq?=
 =?utf-8?B?OGFXWmt5TFFQQytUbW4wME5IMmlTRU84RjNzSGNnT01tVnI1aXpHcWNWUHZv?=
 =?utf-8?B?N0l4VktUa3VKVFUzdG51MTJjbFFSQnNNektNMlE0aFloakpIWGcyVEx1QXd5?=
 =?utf-8?B?WEU4VzRKRnRLUWdGTk5JNTM0THBQd05vRWtNRnV1RFgzUmxjN1NVNFI4Z2Y4?=
 =?utf-8?B?TThPRDVyRmkvSDNTRExlZmNkcCtvNWEvajJ5b296cWNGSDUzNU5QQWxxb0h1?=
 =?utf-8?B?OTcwaWVhTlllN1haVUVIUnhUeU8yNUdqZXVUSDc1K1J6VU5yN0pPYmJBZk1l?=
 =?utf-8?B?KytKZHVBRTAwZ0FXSXhtZFlVa1dob0R4TjRBblJNbUZOdW1PMC9DZXZQaGZK?=
 =?utf-8?B?NC9uQ25iMllTTVJ0enl5dnh0a3J0ZGRONlgzYlZReVVvdzI0Um0wRkd2M0dN?=
 =?utf-8?B?M2VDc2lEQTdZZ3FETjNqMjhZTjNWU1ZKQ3ZGSUxQaTRuRzJmaXh2OHdndUdv?=
 =?utf-8?B?WWkwTjRXbWErN0dPTGI2MmpINFQ0WjBsa3FMYVJBTHNlNVkwU2VrNmMzN1NT?=
 =?utf-8?B?MzUzSFdNMjlXM2lSTmFudXlxc1hyZXZlZ1hQbzhCVENiUzRZdTRQMFBrSnA3?=
 =?utf-8?B?WGNRUlJiS1N1N0taTjZZcTRtRFRxbkV4Ty9xdllFWmJLa2k4UDZUMDVtU0pw?=
 =?utf-8?B?dzBWYWFmNjUyMkhsckYyODZJWFUwUk9PL1ZIUUlOb1pDMnNHRWxYTGs0MS9W?=
 =?utf-8?B?TWdaZ2R5Qk01OEF4SysrUzh2TFVNSUROMDMxamhYdGJ2bm5ZUThJMHpKbGtm?=
 =?utf-8?B?SlRvRTBXc1F4SWhXSzNubEl6T3FzSmZ6d2JaUWtyV05GMnYvTUxWZWRNM1FD?=
 =?utf-8?B?OFphcnpyL3BUdU95RkVUNmxZUnpUWHJPSjJLeGJFcStsZ0dERHhwdUhMbVUx?=
 =?utf-8?B?R0Z1RGxwaHNTRnFuMmVkMWhBdG0vcnNSbHJUZUxFSlFQSHNsbWFWSE45Yjk0?=
 =?utf-8?B?eTNvSG5pbjdDaWRrbUVPMmR6dzgzWDVZMWpuVEQxT25zNFcrZDVNNWt1Yjln?=
 =?utf-8?B?U2srREIrZEhtQzdDeGlsamRpVmgwOWYzMFlPR2czTzBzbzNLYzFxYThVRmto?=
 =?utf-8?B?YnJnNm1Rb0RZcEJyaGpUekNWYW5MbktOSkZsdm9pZmN0OWsyN0lHTHJRaXVu?=
 =?utf-8?B?ZHI5Z3hEYUdPOW45L1AzYzRJWnlwVTg3cmRabTdHcUJ3UFUyUEtxWjR6Wk5V?=
 =?utf-8?B?QzdzWGhTakVFcUxhQTIvZXM1cTRUeDVmdk1KOHBQaE9YN09Zek5ndThuZWJ5?=
 =?utf-8?B?emhtd0cwcTNlVzFvWVA0MEFoV2htOGEyaGNyUWJzSnFzNU1wbTRzVm8yTEhP?=
 =?utf-8?B?aFlUVkY3bFBBcG0xeTJGZ21vcGFUUjhYVmE3dXMrMnNkL2Y5M2QreG9NZEJF?=
 =?utf-8?B?MkRDb0JXNHY5Q3owSmlDYUtRbUpYVjRGaGdvdG5PbUhqelBHU0d0U1g4djhk?=
 =?utf-8?B?TFVWOGpRaWdEd3R3WURmWUVnSDZ5Z1hmU1c0R0Q5d2dPMFRXa1BKUGxvaHZz?=
 =?utf-8?B?dXJyYjU5NkJpM1FaYTFMSTdybnp6L0VQTmorUmxFKzZrTWpsY3Btdz09?=
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
	VnkojOrZx7WhgsPzoJVU6mda7F/nlXlJcdBNYiDhA2xB4uwHFs7dDRH1VtwyGapl3Id0uqBMuaQko+UT4NdUc8M2p2CSXbDzTXl/cwEM9RJJAV5hP+pix5dOzg6Xm6pJpKIzM6IupOsBKX0CtxY/5KXrq5gU266MOCbKmsPJS387nKqcRnTL4h7sIvPz+a7w6EwAwt58UfIASyhPRMbF8RugrcMQ5/EZe549k83orgEhAbraR07mhsXsNb6tGCXTURL09QvNje5ReGHKBeLnT3Ot0j69TMWJ2OOZ+b3Nrpg2vDjq9VhrmbBQuFAIkXOb3FbOOIeK6HpHLjdj2bzVQQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	82oHKLMuhIzKc0rtz/ONGtn0VDwl0eA5mJosN1O9BSZ96ACCMqQewNq5Qp84peAq7UtFCXLq0m0V2j1BtMGh6nTlhrs2tbnchcwYt6w46w5ZSg3HqV75nXBYhT+BDPnqbCvdV5FXFvq8M1QoW5jsDJf3M5BHwiPg1MsUX+K6UBgNocv5S3F3xhXbBS18Ced4jcRshuIWGopjv9k+TGLBwNuVBG8wlyh5F3FfM3E0+xpuWboDq6k50bLLc8LNCwX4djV10yKCe60TP/oNaL0kR/nHel54IUcpQvyandvBxFXKQD3z39GDDeGhh7X/P/e3qMWY88FuddVEUtLrgg9CnXnpY3TCcH6r0eCAJRjvipe9i11VQuS4Ern/yaWqq+LTgs++2sUkjGV4D0Cr2L70n7xgyf0wI813S2byCYNU6bawMc7ufarkKC1xFmTBstrljYoShhx8pS9Y8BEOmv2DFaizdqrUKOHuDkYr+Qk8yQp7qrD/NpyOFma5ieqQZ1lb2bEJIC6n18LMbT7+57B2X9wq5XzdV7pnIoq+M0d6OWuTaC1tLrsDjkwba96ooXhaNA/HVVdpxntFmTuMlcgtZStRFWwAZIFiexq0un0IitQ0Q7cETFRDVEn51xUsEYMijSyVrAAzl9/qPQZ3rjlyzg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9525.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b13a6a4-e18a-4c0d-b045-08df4a7e8ee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 22:59:13.2965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YeK1BfwxJI8bx9FYfzQrnEJ2+p8DDtXlgbBAohr8xnKwZIzP4YeLk514xFQi9esJKoXxYdk4JH/iB4TU3v9wfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfXwp1gpmfqymN2
 ZJ1RdBIwaqbVe5w+fVSk96GRxBjwB5rVgzxotI1prYaJtu/uRUeB5lRMXEHVTb1CiiinBT1zBaP
 PgDw5fTfVWVQ3z5UmH2vjhbCde08wNI7SpyFCpHleyz8POZv8f4UyROEiW9Z1Gt2AFfpyr4gAoI
 llpRytjieTVPVb4W4CAP1kTfI1cI0aC39Je9N/JVOptGM93PqngxANq2TBmw9CgBhofH7d/s6/x
 +FOhPrh5Oba65E5J2OYzaiX3DvEg/iODgbAzN5JwzsMESSrFQRZmsvlXpm0zFwLnlzmzo3aKpoW
 VCK87GReAfW9CPTHghpTb9xEJHyA/lUztaYvAKLjoYA09yJP/8uVNUz1dFwzVmE/LJrMJdllRUb
 hjx2XyvYamgRQmUf2UhHqnCZ+7GKIC+L+IxXzqcDo1frGsbjAhC/dbgS50fUS0TQhFB1y/kSHL9
 T6fu7522Epos4YYrLVQ==
X-Proofpoint-ORIG-GUID: 8-knJq6EHPXqAjq5al3misb5VFfyTpmW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfXxV5RUEK5lhk/
 kku/i1q5jOJ0GMxBqjVSbHYrnpa8smB2pLTrbFFr7xX1Q3QHYuyebXRhPVaSVuOcftyQqeiy5b3
 OKEX2DuSSDxCyjMew9SGkaBIPbLrIkI=
X-Authority-Analysis: v=2.4 cv=NoxE4MdJ c=1 sm=1 tr=0 ts=6b0616cf cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=eHDeJiAMZssr49my3PMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8-knJq6EHPXqAjq5al3misb5VFfyTpmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611240090

c3RydWN0IGR3YzNfcHJvcGVydGllcyBkdXBsaWNhdGVzIGZpZWxkcyBvZiBzdHJ1Y3QgZHdjMywg
YW5kIGdsdWUNCmRyaXZlcnMgY2FuIG9ubHkgc2V0IHR3byBvZiB0aGVtLiBEZWZpbmUgaXQgZnJv
bSBzdHJ1Y3QgZHdjMyB3aXRoDQpzdHJ1Y3RfZ3JvdXBfdGFnZ2VkKCkgYW5kIHJlcGxhY2UgdGhl
IHByb3BlcnRpZXMgdmFsdWUgaW4gc3RydWN0DQpkd2MzX3Byb2JlX2RhdGEgd2l0aCBhIGZpeHVw
X3Byb3BlcnRpZXMoKSBob29rLiBUaGUgaG9vayBydW5zIGFmdGVyIHRoZQ0KRFQgcHJvcGVydGll
cyBhcmUgcmVhZCwgc28gZ2x1ZSBkcml2ZXJzIGNhbiBzZXQgcHJvcGVydGllcyB0aGF0IERUIGRv
ZXMNCm5vdCBwcm92aWRlLCBvciBvdmVycmlkZSBEVCB2YWx1ZXMuDQoNCkkgdXNlZCBBSSB0b29s
cyB0byBoZWxwIHJldmlldyB0aGUgY29kZSBhbmQgcG9saXNoIHRoZSBjb21taXQgbWVzc2FnZXMu
DQoNCg0KVGhpbmggTmd1eWVuICgzKToNCiAgdXNiOiBkd2MzOiBHcm91cCBnbHVlLW92ZXJyaWRh
YmxlIHByb3BlcnRpZXMgaW4gc3RydWN0IGR3YzMNCiAgdXNiOiBkd2MzOiBNb3ZlIHN5c2RldiBz
ZWxlY3Rpb24gYW5kIGNsYW1wIG91dCBvZiBkd2MzX2dldF9wcm9wZXJ0aWVzKCkNCiAgdXNiOiBk
d2MzOiBBbGxvdyBnbHVlIGRyaXZlcnMgdG8gb3ZlcnJpZGUgYWxsIGR3YzNfcHJvcGVydGllcw0K
DQogZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgICAgICAgICAgICAgIHwgIDM3ICsrKy0tLQ0KIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5oICAgICAgICAgICAgICB8IDE2MyArKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0NCiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtYXBwbGUuYyAgICAgICAgfCAgIDEg
LQ0KIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8ICAxOSArKy0tDQogZHJp
dmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5jICAgICAgIHwgICAxIC0NCiBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMtaW14LmMgICAgICAgICAgfCAgIDkgKy0NCiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
cWNvbS5jICAgICAgICAgfCAgIDEgLQ0KIGRyaXZlcnMvdXNiL2R3YzMvZ2x1ZS5oICAgICAgICAg
ICAgICB8ICAyMSArLS0tDQogOCBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgMTMy
IGRlbGV0aW9ucygtKQ0KDQoNCmJhc2UtY29tbWl0OiA5MGQ2MjYzZTg2N2JlNzA4OWIzZDMzMjNi
ZWY4ZDJhY2NkMzI3Yzc3DQotLSANCjIuNTMuMA0K
