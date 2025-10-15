Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB5C946C;
	Wed, 15 Oct 2025 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760488108; cv=fail; b=lh/8vCEC5gpjl73UyHXnqVPtrz/ERgFnLvAiAOJiFwQ96LkGLehE2xZCu32GFdTvjxECay5UWvTIwycqts4bDaLbFevRAJ8D6ugpnGlE51J5AchT6EC2ZcVSBHgQSm4Ac6Zs+Z6eLjzJri5jLIi5pqV+0oSDM1smApzAT/AdnYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760488108; c=relaxed/simple;
	bh=pp2Dt0URv8wPLFp1z7ZCDte4pqUXwdXxgYVO4Iqmlow=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X/lyk1zQyED4Z9C4VGSO/8Ay9msX59Lw8KWNUbPBKr6U4SUwcsN7nJps6o9VxL264n1RbMOVnh+bt13X7RErxhzkoV74Hte7kSsEv9NapgWeklOdsogmy05tlEeIxfV5a/ST/3hRZy6ugFytwl/RBi0SJKwrTPmWF/exEOY/zis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CeiwIRZ/; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eEIlxOn1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e2ISb541 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CeiwIRZ/";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eEIlxOn1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e2ISb541"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ENYWhG007103;
	Tue, 14 Oct 2025 17:28:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=pp2Dt0URv8wPLFp1z7ZCDte4pqUXwdXxgYVO4Iqmlow=; b=
	CeiwIRZ/zZStDCmQtNSUR+77yzDy+KUdzme5D1Y6YRdb/qoKQZbBemKrU5qnZQT5
	lhIftrXYMQX1CXej7vXr27DAOeo+x+BJZ2L/yPF553SeQaecKSKm2ChFpTQOsJPN
	Pj2dVbinFf2Bti4LC266ZWyXshwhyOwnAXW6AidMHpn3wlf++xnSmznurLypqQEf
	Sf17eXInBwl47AmqZQpU7/8E54QM3L+FO0dxWp5fCnUexWaBL7TID3JRCzisy8j5
	5WqQ36MSSGj56KTM18JHaNjD3sQpTr26+3GC3Iu/MKEbY2ybtS5wfZdfFKXphPdq
	eAOhZEESiDG5Gmcj69aUQA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 49ss58ax56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1760488078; bh=pp2Dt0URv8wPLFp1z7ZCDte4pqUXwdXxgYVO4Iqmlow=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eEIlxOn1WeUfSpVo2ci2ZpAQgqDgJskgrI5fleHDXDi2+Ic2saDVV+bnvPyYYvyn9
	 Gs8afcm/7qMgNHFGKyXWoDDtXb4B0sqM9UecrqJ5E4x808Dz0Is2WO5Xne1JtE0e/m
	 +LothPzTMTWm1pvb7zYlZq1RxOM2j2TbeKxiNuttyQbNzG8q74mSPjB6tjBUshv2fR
	 LmFpUjd5tqC86lH9sRvCMUHODZUeh4Rs1QHHsyRkDJQvCAzOBDKauTt8+2cAUD2dg9
	 gZVoJBbOBlBY+S3lMP9v025Pj+0GQerRILu4jGwW0xAIM2kKI5Hy+S3oyHrwmucXk6
	 /o98Su21274Wg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AC6D840517;
	Wed, 15 Oct 2025 00:27:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E2408A0130;
	Wed, 15 Oct 2025 00:27:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=e2ISb541;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00105.outbound.protection.outlook.com [40.93.13.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8B1CD4024D;
	Wed, 15 Oct 2025 00:27:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRwmwTOP/+oHO7IKlmFof4MZQX09nLbkYCwmdqrbcprjRIVSvqzqloS4hvPdpkwGKYWzGmrRF21bqAaahehvaiFx7i9tJNy8NGJKdL9r7mHrTL8FbeurTwwc6/I1H1shLi0xwRxMZ1lTnR21MaQ0XGI+D7Wo2hkAaBN5jnEc0M1+D1ebrnLNFQ3CB3QSl9s62vqCJWkoWVYxsWe2xN4b5PdRVqf7oIuOo0Qs1lc7t+zczwlbXoZ9TAxE1vVvZvWzVb0pOLBIyG7ilEjsGAMbsMT1TfKdnFM7qORr121fKuvm2Q6OR+mnUAlgg6TkYD2HzXbb0LOr81kss4WvD+0kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp2Dt0URv8wPLFp1z7ZCDte4pqUXwdXxgYVO4Iqmlow=;
 b=W/iM6eJM4riJYKRYC73vzSqmFH4NwhIy1yJeSAltxH2laajftxNZ3h30dLgz97H62jYUugDc3K/6z+IRhUfJVmWEM87UCBaaPb9eTUvqPB67JKu50r1uQUAFYN/voYx8WbfYv+bWt1YxQ3nJB1/svFmc5bh8DZKDGQwnV5WS2Ly+hwfuvRZOT9mIh0fgw1Osk1VK55sIfCWHG/70HWgMuXdkTHWKcTPE3WTnMRSz/lZu10G2IOw9gA8GVroNiyUdf8aH+fq0yBtXavwd+SvqudhI3UWDNckZYpUFR/m7TBBkY6tgYegBqAQaAFS9jH7NHpi7PUXAQWFQx0d2b3MsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp2Dt0URv8wPLFp1z7ZCDte4pqUXwdXxgYVO4Iqmlow=;
 b=e2ISb541Q8W7c+picy73OYJSEbYAbwTrfiD59p+ygGH2lLq7/dl16RH6l8uT7ohHJnAE09u3UmrbcjzHuKv93aQWAh3lPSUzWee4AYHe8Z7MEvY5Ajq3vtY17jLiGDFugycMNo43KhpmMi95s4b5oIxJmZm3+Inxi9oPM1mOuFU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 00:27:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 00:27:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
Thread-Index: AQHcOiLF13k3PDlKBkq/J1HUJLefT7TCYMYA
Date: Wed, 15 Oct 2025 00:27:51 +0000
Message-ID: <20251015002744.sntua4kqidgusafo@synopsys.com>
References: <20251010201607.1190967-1-royluo@google.com>
 <20251010201607.1190967-3-royluo@google.com>
In-Reply-To: <20251010201607.1190967-3-royluo@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4147:EE_
x-ms-office365-filtering-correlation-id: 3b84d137-eb91-4467-d8b2-08de0b81ad31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkNHTnNKQitwdWI4SnQ5NXo3N0NMQVRrcHoxemRvNmc5VEplWWpnazA4QU40?=
 =?utf-8?B?WHMzN05EZWZxem5kd05Gb1A2OXhVbktaQWpleDhRK3AzdlZ4R2UxZDFOemZw?=
 =?utf-8?B?U0hqNDRPVkVOdk9ZbUxzOGVtSmVMQzlmNlhZYUtDbDBXenp0ajNKeHRjNHZW?=
 =?utf-8?B?WXc3anYzRFlwTXo0Mm5FWEd3RnVsYUtoSFl3cWNvTXVibEZzcDZZazZnRTcz?=
 =?utf-8?B?VERJRjgrRnBFYVU3TUxGQkE0d1FMcVFqVCttMWtuZDJnTmVjUE1zRnR1ZzZ1?=
 =?utf-8?B?K0xSZGhKYzlTcHZraTUzSXpuaTFyR3RMM1c5VlNkT2trbzFwOG9teTlaMzV1?=
 =?utf-8?B?OTFndldnZVo3dlZBUksrd1A1ekY3WElibklPaldlOU9lb0FEcHJLYjBCUkph?=
 =?utf-8?B?dkRLRy85OEFwT2xjaWRHaG9mTkxGU1M5TVJ4aG5OZUdTZEVPZWFma3J1aDRD?=
 =?utf-8?B?YitnaVlnQ1A2K0xlSmZjYjRjVXVnN0RFUFZ2dUdWc3RxMkkxVms4aWNmbldv?=
 =?utf-8?B?a3V3YjlwTjdKQ3hXT3d2RW4zMFJ0dThFa0kvRlNLcVk1VlkzeUhoMGh3MGd0?=
 =?utf-8?B?b3JIeDRXVkZzbFp5eDMrSDlWYkNZVy9qQlF4MkF1bFR5V3NIN01reElPbW4z?=
 =?utf-8?B?ZEx2YWh0bzQ2U2ozcDV0dm8yYVlRRnNIdEZObWFWZGVmSWJBUktFOG9jY1hK?=
 =?utf-8?B?Ym1hbStaR0kxcHZVZG9lTzUzVGFKZGEzUXJ4WVhFeXAvOVdxUm5teTQvOTla?=
 =?utf-8?B?cWxFcmF4Mm4xRW45OUQ0cE5YNU8xSDdhUWFNcGFjSkp3YVQwR00rRS9RT1lk?=
 =?utf-8?B?MFJ6NHRKZ1ZBUlNjSjR0QVI4UDFjUDRUMTBjeW5HYTRtM3pIVUNTMzFBUGE5?=
 =?utf-8?B?NGFFc1VRYXNJTnNTVGFtcTY2WW1HR1djeXlHSkhYUHFLYnBrYmxXNG4vb1RH?=
 =?utf-8?B?cHNFckt2WjRqRTR4eFNFMk1nemZCNXZ0VzFsa3JyTnNUSU4zbXRSdmZnQnlW?=
 =?utf-8?B?UGtZRmVXa3ZQR04zZ1lJSzhVZUlpSXh0bXRGcndrRnF5TGo4U2UzQ0t0Nlk5?=
 =?utf-8?B?QXRwOFlKS0tUOXk2cHFBWktJNWVIWlltNktZUkc5bXFtdDRhQXEzWS9TREVI?=
 =?utf-8?B?UHQwc0pvZjhIVXBOUTVaQXI4VHJqN1JiYUZhZkl4MWljZVFsOXBxcVBPdzdR?=
 =?utf-8?B?N25PYU9JV3dvbERtQ1dscUtsYlJzVnVJQ1Q3cXZ6a2VrWFlZaXRyS2t1aWkx?=
 =?utf-8?B?c2d6T2NoZVR5UHBlV2YwdDZadDFwZGlBcVhLSjE4WFZWVlpvNkRPOHQzRnoy?=
 =?utf-8?B?UG81ZDhZVWFIQUdISmdFeS9zVWQ5VkMxQ0o2eUNhNkFncVNqNUhYYUdrQXo1?=
 =?utf-8?B?ZFpXVXJhQXBERWI0L2UxL1QxNkp6UkZWd3psS3RLVVFieW5RbzVDcUpxcXRp?=
 =?utf-8?B?ZzQxTDFodGFJZUMxWGVvZk8wcmYwM25rU0krbjBjNnlEYUpGY2RsZXpTb2JM?=
 =?utf-8?B?TFlaVVVGTTRCVHR1eGdaSVFFc1MwTForUHVWUnVEWlVtQkRVZkVtZnhSTThr?=
 =?utf-8?B?MUhGTTgzWS9tTG5pZ1dmbmVKTWxFTm90NTdCVmRXVWw2OENzTUJZb0h0REZM?=
 =?utf-8?B?c3RpOUZMKzdoN1ZhOE9Kb1JxOS83ZHl6anJCcE1uMTlMRGdKZHVvZmdhQ3J5?=
 =?utf-8?B?TUdjeUkzNDZ0c1JpY2NSN1g0Q0l0cUVjSmJmaVlEcTdlcDlscnNxNXh4c0xq?=
 =?utf-8?B?b0tGRVF1OEZET2hPY2h6VkJha3VIV2JHc1pGZlg2bElENThRNjZQajBFWUpS?=
 =?utf-8?B?cTRzZzdlNnFRYTIzS21CM0MvVmJsbklTcTEyMEE3WU9BM0ZZeFRQREhhVEdX?=
 =?utf-8?B?NXRXeUVKaGIwaG9BYi9PVkRweTlocU5FaktMZ3pya1pGNkRvMkRlYnFLR2Zp?=
 =?utf-8?B?SmQ4anBhdi9YVnIvTnVqd2NTdk1ObnEzdmpRNXVianRncUZ3NkxFUVg4OWNj?=
 =?utf-8?B?RjRteGtFS2pxb0l1WjRKVzRJQWtGOGlWd2lYZjlHR3UzeWVhVUphZ0cxc1NE?=
 =?utf-8?Q?UKgSU4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ancxVEhkZVFsa0JSTklqOFNPRVNXVnpkaDZSQ25aNFI1UHcreTgzeG9qcm9h?=
 =?utf-8?B?cHNzWjJpT1lWejA4RGZLYklZR1NscjljTDkyVlp1TEYrWUh6WldLclpDOFNm?=
 =?utf-8?B?QmhOaDdyOVFrY2pHeThLZm8wQU1xTlU3RWNXUUdGVjl6cjZpeCtXYTM0QW5I?=
 =?utf-8?B?YVh2YW1yNTVmNjNDRHAvWjZrdDNSUmk0RXRqSENYUXM3YkNyWk5xSlAvc2VD?=
 =?utf-8?B?OTYyQ0ZUNUt0eE9ZdEFRT28wVXBxbWJHRncvT2MvWVR6WGxQZzFnSFNuNGRI?=
 =?utf-8?B?enRTZjFMOVp3Q3Z2MHFJbC9pSnM1SzhqOU1kcHhzcjVjSWJJaTZPMFlwcWU0?=
 =?utf-8?B?cEJEQjUzM3lVQWp1VUE0TXBFVXRyL0JCd3BDeVAydytEb3JyR244R2RVdGNn?=
 =?utf-8?B?dmdmVW5FZHBxcXlxTm04cVZNK29jTFQwcUU1T3hDMDlOM3JEaWhSZllWNlMx?=
 =?utf-8?B?N2JmTDFEMmgvUnJobFhBclN5WjRZSDBLbndIelgwcU94eTZhUmVqTTFXbWZ3?=
 =?utf-8?B?dC8xOEFPcy85dGFpZ2JNRkVIclYrK2p0bzdmOVluMHRrV3NVN0FOT05pUUI4?=
 =?utf-8?B?TmFwYWJ6ZGcyWldWUFhqU3hGUWhySklnby9zaEVuODIxU01vKytFc2FRYVdY?=
 =?utf-8?B?YVF5WEhXV25WaTJEN0lybDBKZnVEUWcva25pUGI4NFZsTnFMTThQcjBZSkpN?=
 =?utf-8?B?QXhDbyt1MFdHSVVaNE5qbytWTzRGdllDaE5vU21DdzZ4Y1NlSXM2ckRYQTBP?=
 =?utf-8?B?c2ZnajhRcHBCbWVxbWJaNEJ5cTBGYzRQeFdjWitNZFRxRjZPMUN6U0ZUaEUy?=
 =?utf-8?B?UmxobzNhckRhNUlLS2lUUUxNZlorZmFXM2RlNzhJbmxkTkU1aFU2UVN1R243?=
 =?utf-8?B?b3diT1YxSmZXMURETnN3MVFta0RCYThxS2g4cmh5VlVsM0pybUcrK3VoODVC?=
 =?utf-8?B?dUpRTU9vbU1VTHdvRDFMd3hMOVBUUk5VYmtYcWovbXR3R3N5UGRBR2UxdGxq?=
 =?utf-8?B?cTM5aDlWSDVJODR5Vmd0TnVEVmRNNDF3RllVVC9sS29EWW10ZTJPMzdNUzhm?=
 =?utf-8?B?Y0NsUWEvTmlEclFBU3BLZldMZkIzampRSWRsamZIdFFiMVQyRVFyL2ZRMW1X?=
 =?utf-8?B?MzNIc3hZaHVOdmZybUxEQzRQOXJsSGZDS2tYUCtrbUlTdjZSQTlUdUVWUEk5?=
 =?utf-8?B?VkRUMjZ6R2RhekUwaWJxcW1EOXdtMHpmbitNQjJCeVNBU29sbDloMXhxR1ox?=
 =?utf-8?B?TVBzTUpKWE9pZ0ZWdU4xTGMyaDI0QjI1QWcxU2dRUEM1TFVMRnhvcjVvVEhZ?=
 =?utf-8?B?U24xTFpLYldyd3dnMit5UDZlTXZwT2xTRys5bzZDNmxLTFhKa1lSekYyQWxl?=
 =?utf-8?B?TllPQXYrZXNsVlN1WFdHd2tCRG05V0Zsam9EblRXcjU2bUhhcFNZNkRSelJ6?=
 =?utf-8?B?VXUxOWl2M1htaE5zajNmNW5SeStKTHBuUWlwUUMvbnJGdU8vcnZTbGZZbFhT?=
 =?utf-8?B?ZXhEakswejE3SnI3V2ozR3B2aVFFOU5JMFk5Qk96VG9uNWo5OEFLdUpWRGVw?=
 =?utf-8?B?TENESlpMK1NYL1dySWloeHFjMHROME1PcXVuQXJ0OWNlUGlDTis3emVJQ0VP?=
 =?utf-8?B?R0JodHd4QzN3VEJYR1BnaThudG15anFmTmJiRjhIRitBbEw0SlBKaWkxRjAw?=
 =?utf-8?B?WUxGcURjSitkTmpLdXQ5cFlMN0hJVGZya1lYcElyQkNCclhXR3haUDNRQ0Z6?=
 =?utf-8?B?a3lCcCtuWnJaTi9BZmVkZDJLWkRiR1FtdnlieTZXK0ZOVnJBYk1QOEFFN2Y0?=
 =?utf-8?B?LzI2ZStEbUUyNWtldXBUQmtoRDJ4eFhmRDhCYXlFY2FpajJHK2dFNURuYU14?=
 =?utf-8?B?MTIydWJtQk0vWXRNQlZnTUg1MVlUNWtSK0JsaDJVTGhnR1BDblh5K0NlSjZs?=
 =?utf-8?B?YjVDaCt0a21GU0huTE5FSUNmc2pSc2k1d0xrNWE0WWZJMlArMGRMQ2JSZXJk?=
 =?utf-8?B?dEllTE4wNWt3Rm9Td2JHNjA5cWQ2aWIvL3hCLzF0K2ZrdDgyS01aSDVNbVdE?=
 =?utf-8?B?V1FHWVU2SG5OeGVSNUl0NmN5L3pyL3h6QUxGZkUwdzlvZDNXZ0Y4eTBmR1dP?=
 =?utf-8?Q?wyzVxHppgI9b/65glYmcS7V8D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D0945EEC942DF4398D86D735CB4B35E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4mbJ6YTEnZ9kR3t+Z/0VPKjrEuzEHw2Oj/oyOcxsQ8Wil4vVX2qimUSFFm6NV7aX3GmHscB0Vx2In6Hh0tkIHqYC9psbrPxJNFeTgpWYQmAK7wWmN1pFNgE/JWR2ULeWGlz+oFzmCKuwFLIIiKp0Rr6w1dNng02uu0UawDnDmM/iz0ukownKgB7Y9/3p3KBLijRiNY3IEbFIzgaL05uAMUDLKMVe9/PDFOQ0zLv38VrujfjBpdpCOG9ufaY3YD0UPTzr03yYadQJLnoFI2uiEy9ik+LPmucTVb4xUEmHNJ0tnUA2n7rrsKcSpvI+EUl+Ca2r1NY8m9sdNLcXIDfqoOEGq98BgAtV3IY1nOX7dI207ZbN1K3e8YrLwL4cWhJNDJFMy2gZzR2y8gac6xNbkI9+EYASKqB3giVGhDT1cklIyX1RSHLdZG8YsIzcJpnuMPmnWlX4zyVgKQPaNemJUTuBu1MBxP1bnNbxVMP/vWln3KGD8KOKEJ3XrnZFClruH4Zhgdxiw1TVR4RGjOLbIUbPhmqwFH8LN86Sq3+eW+Or1HC+U4bmQDqQOB1px7b+FaJUbJa4dcz9LDLkrHLvr9RDZbBlMFTMhyq3UIMFjxy5DMaT/MuMp5jaufRhkizFJiRCN5pMQIyE9le3Wtn2nw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b84d137-eb91-4467-d8b2-08de0b81ad31
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 00:27:51.7130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRKEtrp8aOSAgH/jYeNYUUv73q36+lKJAAfnuScapfuHPuuc49lSmTS3Sq7Z5hxxjzijQR2F81zWm/Cao2/ipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-Proofpoint-ORIG-GUID: 5_plVsAU0T1g6hpBe2oGI9zJ9p4kA130
X-Authority-Analysis: v=2.4 cv=OOcqHCaB c=1 sm=1 tr=0 ts=68eeea8f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IY6znFXSvJnw3NgykZoA:9 a=QEXdDO2ut3YA:10
 a=HhbK4dLum7pmb74im6QT:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-GUID: 5_plVsAU0T1g6hpBe2oGI9zJ9p4kA130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExNiBTYWx0ZWRfX6AshGzaCa+W4
 pyE76MbMwHMHPCpvDTeF6Np7TeQV0IrTcC3h4Nc2HFlhSh2YkJC1eQ1+vGdNg9O5sB5whhW5hdT
 3Ae2brGrCIKNjM/WQON440Ih9L18ihUt8TM1gMDWGr3len6EVfdj9siampeiWHS5wvZ4PbfiJKY
 196v4jPEjGQsFdo6ZSYB+1ZH8kmUHbu3YheIUx3EQgOVI17XmRNDwV2X8kXA+nQOv6R4eSNX3Nn
 BXoUPiI0g+i7jxdIFgAH2wTnaYCCeUvv2/j5taZTOE4ZKbSxw+t4FxV19wzQZT9CblIL6xkjmu4
 0mtoryFaQ6KTtdhXXSK9f+kjAngShpZH6lhNAccvx0DSUXeKIv2ZAMSMc6D+5TzjsIvHrCMA3lg
 JIu32L5mba5ZqXOMzcANC9L3N7aDFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 clxscore=1011
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510140116

SGksDQoNCk9uIEZyaSwgT2N0IDEwLCAyMDI1LCBSb3kgTHVvIHdyb3RlOg0KPiArI2VuZGlmIC8q
IENPTkZJR19QTSAqLw0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdj
M19nb29nbGVfZGV2X3BtX29wcyA9IHsNCj4gKwlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhkd2Mz
X2dvb2dsZV9wbV9zdXNwZW5kLCBkd2MzX2dvb2dsZV9wbV9yZXN1bWUpDQo+ICsJU0VUX1JVTlRJ
TUVfUE1fT1BTKGR3YzNfZ29vZ2xlX3J1bnRpbWVfc3VzcGVuZCwgZHdjM19nb29nbGVfcnVudGlt
ZV9yZXN1bWUsDQo+ICsJCQkgICBkd2MzX2dvb2dsZV9ydW50aW1lX2lkbGUpDQoNCkNhbiB3ZSB1
c2UgdGhlIG5ldyBwbV9wdHIoKSBhbmQgKl9QTV9PUFMgbWFjcm9zIHRvIGdldCByaWQgb2YgdGhl
IGlmZGVmDQpDT05GSUdfUE0gZ3VhcmRzPw0KDQo+ICsJLmNvbXBsZXRlID0gZHdjM19nb29nbGVf
Y29tcGxldGUsDQo+ICsJLnByZXBhcmUgPSBkd2MzX2dvb2dsZV9wcmVwYXJlLA0KPiArfTsNCj4g
Kw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19nb29nbGVfb2ZfbWF0
Y2hbXSA9IHsNCj4gKwl7IC5jb21wYXRpYmxlID0gImdvb2dsZSxnczUtZHdjMyIgfSwNCj4gKwl7
IH0NCj4gK307DQo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkd2MzX2dvb2dsZV9vZl9tYXRj
aCk7DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3YzNfZ29vZ2xlX2Ry
aXZlciA9IHsNCj4gKwkucHJvYmUJCT0gZHdjM19nb29nbGVfcHJvYmUsDQo+ICsJLnJlbW92ZQkJ
PSBkd2MzX2dvb2dsZV9yZW1vdmUsDQo+ICsJLmRyaXZlcgkJPSB7DQo+ICsJCS5uYW1lCT0gImdv
b2dsZS1kd2MzIiwNCj4gKwkJLnBtCT0gJmR3YzNfZ29vZ2xlX2Rldl9wbV9vcHMsDQo+ICsJCS5v
Zl9tYXRjaF90YWJsZQk9IGR3YzNfZ29vZ2xlX29mX21hdGNoLA0KPiArCX0sDQo+ICt9Ow0KPiAr
DQo+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGR3YzNfZ29vZ2xlX2RyaXZlcik7DQo+ICtNT0RV
TEVfTElDRU5TRSgiR1BMIik7DQo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkRlc2lnbldhcmUgRFdD
MyBHb29nbGUgR2x1ZSBEcml2ZXIiKTsNCj4gLS0gDQo+IDIuNTEuMC43NDAuZzZhZGIwNTRkMTIt
Z29vZw0KPiANCg0KR2l2ZSBtZSBzb21lIHRpbWUsIGFuZCBJJ2xsIHJldmlldyB0aGUgcmVzdCBv
ZiB0aGlzIHBhdGNoLg0KDQpUaGFua3MsDQpUaGluaA==
