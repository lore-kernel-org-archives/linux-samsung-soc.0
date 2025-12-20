Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70757242D60;
	Sat, 20 Dec 2025 00:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766192340; cv=fail; b=j3R8KFw7jAxf/EN3MXmBeA/jeuOCVkWilG3uLnVzEhNb8kmLRRy8dpQnVmlK+5MQ1hziSrNcGDLlWIokWtVsHfh5GEj0z05PYoB2Z+AZMbyivajKjHm+HG2zVuOp2SotheydO4ITcWQatF2q8dkquj4p+68WhzOXVME+QZ8n404=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766192340; c=relaxed/simple;
	bh=XWsJ2mbogP3vLvZaMybARKgyW0qXZxyB/CEoorDvtB0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RfJRPidKA9Z67ymA2Wy4aJQk6HBQ5yyS4xXU72MqXQhb67R6AnB/oix4te+LQByDIlkjxF8aOuKzH6r3ZV2Ax+MuM+td7GMv0EEQ1cNIJPEUxbBCppkEQ0zj0dB9x0UOi3LYzr5E3jybW50ftP8MDa7uH2r4NlYYeUXqTBTkAZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j1nOBfsk; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T6yUBO+f; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Gk7py04S reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j1nOBfsk";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T6yUBO+f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Gk7py04S"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJIhvCw1475486;
	Fri, 19 Dec 2025 16:58:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=XWsJ2mbogP3vLvZaMybARKgyW0qXZxyB/CEoorDvtB0=; b=
	j1nOBfsk5AUdkE6VT6/OUH0nnobOWwNLNqLDvMJIziIwOJCCgkHhbQ6OqatEpqpf
	17hq3LihSUYwelB7ROQ+SH86ynddk44eSs6LabLsshIUIzmTJeXSzrjR/3qcpXbb
	CH0J5Pyw2Kw0QNlFdo/ylIzp2Wb5Bwg0js+OTj86juDeXyMXp9swutLdCiqwNZHh
	HuZBo6xNg3cB/Nj51A6i1DTN4jCcfQWgW6sJHHtl6RfVmD0/jaT9dQXFjOAGgU/3
	r3p/8YO36TDM+kH/0nqX0StLNOIJQBNkP5Iufzfsj22OseAwCXYoY4RMg3aDngbN
	syXnQuleJckMjqCT79mGiw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4b4r3mdhav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1766192284; bh=XWsJ2mbogP3vLvZaMybARKgyW0qXZxyB/CEoorDvtB0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=T6yUBO+f4dHstvWr1QFuaxa73/o05hBCRgP5Fs6kFdPylRgUZW6EvAA+6874rF7Zj
	 Tgf5x5PmUcxcS4CrnQOM99vqALj6kKffD0qfyc1ohrzxJFklYSjCy+bmaELO2ivm7g
	 1K+xwSpG50/hkYXk+ElZavHS4xk1FJZA37NQRLzgh6ELP5h0dEQmoGG+XqLPnP4lMB
	 O+AzXUbu0SCoHk1VkS8MqTqFCbXGgsO+ghb8bGUTkfVgIAivTWhBe9oEkuUAMQWRMg
	 5SLSoYPb6L9VrZ89CJ6VQs83fak6j9n53JlbQDSF2rfrCcbbeHAo8hvmPkbTC72bUb
	 ueXSD/AbfMXjg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 134C84048F;
	Sat, 20 Dec 2025 00:58:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B93C2A00F1;
	Sat, 20 Dec 2025 00:58:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Gk7py04S;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00101.outbound.protection.outlook.com [40.93.10.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 31377402D6;
	Sat, 20 Dec 2025 00:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZdogXw9JWwsIF0Gq+UNtek6QIa5WthSx7QZZ3uWBQX9+iQLezjrFhziGILbrForrIAsmQtG/P9/ZQ8xWh0D2F1S9uL0TPgl1bAbZXSHoH/1cOdrszO123lB8Uzm2Kbd4WA1vZCQ6W34e+SGTPMAQDZGTgTljVImbDYjWAnMi+3s2RBEC8bgymU1A7PF5A5JJgXSHubRFmekX8oYF2GQJQxtAAKOTRGYSqBos/cvnvC8tvKhFO2XzjXgYYRcM8YweOCtAAwtw+aUNA8dPbOG2+IhF5RP+DGZO5cLJkIZYXOo0jM9l0IfiPpAP0/qxnhbXf6lGs+8oL46zqMmQMs/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWsJ2mbogP3vLvZaMybARKgyW0qXZxyB/CEoorDvtB0=;
 b=CqXhk7+gF1LMMd5U4w2ufpLq1QG17SF+6yXIGV03MRlpVwagiWNC2hlNdbfjlHdppS+bjMTAzoePft5WltL2KC3zYJCQvwItXZ0QLVArfkNs/Um/IKqBYJLteJWs/5ARkwwVE5G2BapvJL9mwTGCtJLeZtdeL2Ric4J/NzznG9w5F2sVLi5Caxy1rVKAVHp6ulf604cjjyCfZb5KqbSs6mtc/92DC/5GtWXg6y/2B16lZJ19MGXmjXzJVfXc4NpNVwnPzmUY7BsJj6UF6MAXzx1+aURjUlt3LbBCXc2L3wXRdQYmqNtipgszBXfYd0KVzDEZMRNT3ymRQpzCwSF5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWsJ2mbogP3vLvZaMybARKgyW0qXZxyB/CEoorDvtB0=;
 b=Gk7py04SXCJb92sb2RFuujse2MBpPoSXMJ7oujITkt/LzdVL0p+hVPIXRZwVgfkMOUY00EZ/3gAbBc9nw/SoQ6dNRKz0LSVWs8k/ZxhbSEUaqucBxvWjFTN0lVERFrIVTUxjBXk88dQ0IoeJbnGLNAYc265GA4TjEPto5pD+c9E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 00:57:53 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 00:57:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Doug Anderson <dianders@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        Joy Chakraborty <joychakr@google.com>,
        Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v10 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Topic: [PATCH v10 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue
 driver
Thread-Index: AQHccFPuEWAwRuGTMkKI6rcJrGyigLUptqIA
Date: Sat, 20 Dec 2025 00:57:53 +0000
Message-ID: <20251220005742.tmir3mpadnwe5rtr@synopsys.com>
References: <20251218-controller-v10-0-4047c9077274@google.com>
 <20251218-controller-v10-2-4047c9077274@google.com>
In-Reply-To: <20251218-controller-v10-2-4047c9077274@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4138:EE_
x-ms-office365-filtering-correlation-id: ba5f307e-245a-4fac-f7c6-08de3f62ce75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTlhaXBjb2Zqa3M3U21vczFFOTI1bGgrKzdlSVhWR3BHYm52UXQxQ1ZBT2FL?=
 =?utf-8?B?NW1sTTlsZW9Na3Vwb055aE1ndlhwZkFRNGtSTW9PUlBJYnZBQjd6b1hHcmVS?=
 =?utf-8?B?M04ydGZZTFhyS2gxQXdGeVpaT2VNTExrcmRRM3FzSGM3NmdpUFBndVBvbVBa?=
 =?utf-8?B?MVhqT25qa3JFREljc1pOVWZsMy9RdkVISm80OU04V090SjJXTFl5dEhMQyth?=
 =?utf-8?B?aGlUNDIxZzk3QXF1Wkh2OHQ2a3labjc5azlxZWU3N3pYMjl3ajRTZTV4OVdR?=
 =?utf-8?B?b0tIZEhrNlV1b0hZc05EMFIzRjd4OE85VnNIeWJERjFPbS81bGN2K21MQ3lr?=
 =?utf-8?B?SFp5cTgwaWdjQ2VYRzlRRk5RdEJTVytFbGgzWGt3ZjBpaExaRnVqSnRkV0dt?=
 =?utf-8?B?TUNDa2RPYWlGbzVGd29PeUNPL1BQUTBSZEZ4aEczb1EwU2JIdmdZcFFzUHgw?=
 =?utf-8?B?c280OU1jK2ZsVmVlbWZJR0JYNEJxTkFVa0tFMERTWThEam00bExlaE05alNB?=
 =?utf-8?B?N2hwQmI5NjNrSGhheU5OQVdXMUlGZ1N5bGg0bUlNWUlER1EvNnkwQTJ0Smo5?=
 =?utf-8?B?ZkZtL05wNGZVeHdFbUtDYjM0NlBQUHNmT3hMbUVnaVc4YS82TVNQNlhNRHA5?=
 =?utf-8?B?UGJMaU55MHdYZkRxRFRPbXZQMS8vQWxwaHh3S3FnZ0oxVWRqWFB2NzVoc20z?=
 =?utf-8?B?MTJMbW92Tk5pYkdtRUhENndacVFUTHZWRm80ZWZvNmVxM2xCVU1Bd2E2MGRx?=
 =?utf-8?B?MVI4YktDQkdRVnJ6YzFQZDltcVZkdVE1MmI2YTZGelBDUHhJVDJUR05rVnZn?=
 =?utf-8?B?WnNtS21XSDF0TGthemVhRVZ0ZWhDRUtRMzhvTUVjRjJWUWw1bi93c1htVjJi?=
 =?utf-8?B?M1FZWmxYdlExeE05SUJtY3V1TlhzZ01LRTNIcGFoWVhJRENWNktrYktZUUFK?=
 =?utf-8?B?T2V6ODZpYzVDd2lscmorVFhnUmNTdWV3RFNKaHU5ZTVDWWVzYnJiUDk5NHZn?=
 =?utf-8?B?TFlseUZRNmlaN3VaNGhyZTZKaFhiZmEzSHVSYzYrRHNLaUJQSjk1cGVHWG1P?=
 =?utf-8?B?Y2YwZTJsa1BvRFdqenYzam0rcXEzQkdWeURRWVFkamtxMmEvdmhRWDJYbVVS?=
 =?utf-8?B?Umo4RHhQdzFxK2Fscmt0dE53VVJ5RWFEbzg0WW1jMTN1K0JyTFAxZlR2NXBV?=
 =?utf-8?B?dVJLaFdYbVZXTEVnOEhTc2taL1JyUUk0Vld0RWl2d0FCelNhS0hDanlXUVlu?=
 =?utf-8?B?Q3FLSUJkMDF2WWgvelVYbk9KeGFES05LelJZSHZYZytxSGtDVmQxS1hwTWFs?=
 =?utf-8?B?OVYyL2RMbUlVZTZLSEVPTlo1YS9hblJnSjV5SERFNENSc09JVGUveGNHQlRp?=
 =?utf-8?B?VEhMK1VNbVZWZFVKOFNDSEJmazgrZk5kNCsvYUhDTEs0cTMxb2Flb0RnZ09j?=
 =?utf-8?B?b1oySkloS25qKzdLSDBpV0twZXVqcHRNS2Jsa3dseERvN3p4dzcxMnFVMXB6?=
 =?utf-8?B?N08zdzlvSU5TdGtneGl2NHYxcGEvbVdUdjhLamlsRXluMm4zVHN1VTBidno4?=
 =?utf-8?B?MUtFZ2ZheUNSa0VWOHZ5UWVubnJmR08xU3hid1R2ejVTcjJibHFiZ3E0UlVF?=
 =?utf-8?B?bHVpV1VtbUk5NGlqRTN6UG1XYzBwMWZLNFFQZ1Erek55V09RM3FlamRscTR6?=
 =?utf-8?B?Szg1eWlpdzlLdDBBalhNQ05zREpPM2x3VlU2U25aN0p0OFFmcmdqTVdVZExG?=
 =?utf-8?B?T0JmRmpIOC8vQVZrdjVQRHBEZEFNcUpkeHpqdXg3QlBpUDkzeVlnZWdjQVRT?=
 =?utf-8?B?OXNXakRIYWdWaWZhb3hxRUIxZ3NmZ3VPUE1rY2JEOEVBQVk2NTlNSENqaWN1?=
 =?utf-8?B?RVZzSk81VzFwQS9sRk5DWkJJWVhYUWdNbldKNG40VjhvWmNZWitNWWswdWxw?=
 =?utf-8?B?SFdabXp0czFHWjFhYjUwS1FDVmJHZ0ZBbE9iWE53WGp6Mi94K2RiNEJabFpW?=
 =?utf-8?B?V2V6QWlUQVNEeGowZUhXaTMwUk5IcEdqaUNFQ0pCajM2SzUrNVZFUHkvb3l5?=
 =?utf-8?Q?m05gYo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U1E4U2c3anJMZFhhRk02dUhpaGovRWZ2MG8zS3FDbG5ROXVEcG9jajVuS1BE?=
 =?utf-8?B?eFNBYStGeGg1VGhrZnF2eXRHbVBhTGtGQlNOaDZsbDFNRnZLbm1ma2d3RElQ?=
 =?utf-8?B?ZWxQNGtXZTkvSjBVVFdrQXlhWXJQcFI0ZWU4YVdJcmpNS1RLVWZEOG9OL0NI?=
 =?utf-8?B?dDhrV1prS1JpREw5MkdDTFhBNzVJNkJXVE5qdmphQW9nQVEwZFlEazZVTGNH?=
 =?utf-8?B?SGg2ZEhSNWsxV3B3R1B5bDhVM0Q5UW9WSWY4YytxcmsrM1pmZm15cWljeHVs?=
 =?utf-8?B?VjhMVmpKakhjZlBOamRGTW9lL1JYYjJCWnFUWVV6c010cUNHMWNLYUd6V3Ra?=
 =?utf-8?B?eld1Slc2enBVVFRVeTdNaTZiRyt3TUt0RHBCYjZwTXNJb3dZay9BbWZLT3BP?=
 =?utf-8?B?VDA5ckNFc0xzdHNIY0R1b3FZZ2hLRG5CR002YlZmZ2VjSVFDZFVzanFnUSs0?=
 =?utf-8?B?UUg2ays3STJOUVJSd2dYbndtdHBJT2RDUlVWbm0zbWtnbUJkZURBaDBvckhY?=
 =?utf-8?B?UHYrWjIwNnlXaUlJTCtkTWJiUXcrbnc0NDM4UjZlTjBtMUxkQVZ3dE12LzB1?=
 =?utf-8?B?QjJJdFNWOXNjWlViQVB5d1loQ3RqKzhCWm52VjZEdUFFaWFRM25pTnB5bjdw?=
 =?utf-8?B?RGZPS3RBYUJudUx6VHdWakQ3UEpuQXE5eDVYTSs2RVNEbG1sSEE3TkRXZUQx?=
 =?utf-8?B?dUkyczJKa203ekxMemdoTTR0ZlRDY1BFQ0ZZc2o4VERkcGhhSGlYVjhScTh1?=
 =?utf-8?B?QTBFRUhieGlLajFwS3RXdW1QanlFRXh2cXNEcDkvTElSajZRWHcxSXQrdXNp?=
 =?utf-8?B?UTBBR2RXajZHSW9BSGg0azdoV05jUlY2YXkvQVBCSVl4SDlRbVZFRS9teFJM?=
 =?utf-8?B?dFV2Z1NCMGxKVXc0WnltQmFMeCttOCtuNVB6RG5iVzJlc0hndlJvMW9TY0Rq?=
 =?utf-8?B?WmdzTjcvTzNpUlRZbHdTUVNFbDVoN0h2Rng3d25uRmJjZ1dGUWJ6TGVHL3Jx?=
 =?utf-8?B?aE1GQjZKcGxremV5UGdnSXNpU1NEdUYreFQzc0dmbzZLdGRzZktpcFhJZzM5?=
 =?utf-8?B?d0kzVzU2MWkvRGZ0RWxCRHcwcTI0bjZpeHdYanp2R2loVHFjWHpGaXVjMkM1?=
 =?utf-8?B?cFRLdjJiS1dqZlRoNThRcCtVc2RLcXZrQTN2anBSL3VxN2hlMWJoV2toRjhk?=
 =?utf-8?B?VWpNWU1oamhaT1ZUMlpmZVNTWE5kTGcwTVFwV2hVcm1JdVVLNlhwcEZDVUNl?=
 =?utf-8?B?MHhjVUFnN09SZktyNE1Nc0JJTDdxOVkxOXZRQ2NiMjNZbG0wRFBYWkp5TjhG?=
 =?utf-8?B?Z21qbXpZb2wyczB5RjBJTTJUSll4ZWpRQ041S1NtVFlsNytkSlZTRVowM01C?=
 =?utf-8?B?UXF4aHFwckU1NmtDV05ZcWNoM0Q3dTNuOUdGc3NLU2RHa3pCUVJCeTZzYTJr?=
 =?utf-8?B?aTRUcy9rTmUrTElvOVpWZ0R6cjlDUjhWL1dFa0hUUzBsUE1ZVU4zQjMxRlow?=
 =?utf-8?B?M1NUUGxmZXVlOCttZjl1d0lMRHRWek5aNHhVRXNSUFhOSk45NEZGRVIxTk0v?=
 =?utf-8?B?RkJCZ1ZNdXAzUFZxSU9ORWJJdGxhUnVKTG9FaTRudEo2ZWRqcDhJbkVoWlV5?=
 =?utf-8?B?VFJGckF0L3k0cEplUG8vVlNUbkZKZzU4RXkzc2JWbXJScW02YVVBVldYV1JX?=
 =?utf-8?B?NGlCWE1ZcDRxRWVDU2ZZNXByZVQzWndaVnZtbnlWeUJJbFVaVSs0V2d3bjNa?=
 =?utf-8?B?REVlZVU5azRieVRFeGVwV2UwQkJVTmxPVUFMaWRDTDRtU2lJb2FnRXlSUHhx?=
 =?utf-8?B?WjlFL29PYXZpNDBnVnVvNUVURllqN2g1d2xZQWpPTlEyak13WnhoTGhUSFFF?=
 =?utf-8?B?ZjFWYmJZSnF5cDJNeGxMMzdUWUxtQkdaOU5Ld1p0aXdHNy9ZdjdlaEFkd1Vn?=
 =?utf-8?B?SFdGZVRsOUxsaFhWTm9jcDI0TTBiRUxUZGlGZFUyK0Y3cGdFTjh1b1A3eDls?=
 =?utf-8?B?UEFoLzRZaE1hc2tWOWkwRVpkYktlZ3VSMkF0U1VUdEFMTEt1WElISVZuZTc5?=
 =?utf-8?B?T214WCtDd2IvdW9pRVEvZDVOY1NsTUxUK2VxMllUYndnMG5USlNEbWduRDcv?=
 =?utf-8?B?NnpNdDBwVnNXaTR0QlpRRkV4dHVIQ29IWXhmRGpJRmdaK2lVbFQvbzhzVTMv?=
 =?utf-8?B?VUE1M3diVUptckorNE9OUGpjTnJMaFB1Yks0V2t4RGJ2clc5anV5RWFQWmYr?=
 =?utf-8?B?MS9LQ0szL0wyZnpzZHQ1NHdnSStlMWpCRnEvRlVvSWNwWWNUN3VlZzlmZU1H?=
 =?utf-8?B?WjVCcjFtblJ5MFk0dVM5OThKZjlIN01pOE0zYXhNckZJbGdDOSs3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B5710F0FD188C4E878265BD61B7A0CB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B2j4UYETUlDcvLT8waiBEMhqS98GUeHv3pIB6NzZ9txVkiiTFgCqrg5cQl/y/6WNlwk/jUNixKIlnFitfjLi70pv/nomKc2AUbjzRTu/VaT5vTtwYiMSM7lOCzp97aUSiJEVuqH9f586dqB3PyymIhs15X8ZLSEmSoKlpX4KyuAWPQkRg1kUn/EOWfZA0ZiDhb6+gevvBS/ZKc5eMID4I4/SDjxFI7l2BhwcvpiFuPSwPZ+KuNii4Bzu0JUxFYnuR64hMsAVimHwjJ0eHmaME2GeGigUS6p6jwnR9xsQrTc9TFdEiWotDU1S95RIJOy2IAFHMMG4ylHI4lxQGFMRMKIavYvFbDfhM0Zr6fetZhDnSFKTcJCE+/suI/YfODtzI9DBO0cTDmYRnqQtY2hVmX/8rCkUcYHBRIuKDdQJnhyrc+KgXObpqcKc9jng7hO2ZYz8rRxPNjsFLtFY83NBvgJELoLxxLoxLTICNe+3VW2fFSJ9Zp+AQCQ9iqS225azxuqlp3EkoIZgfLacj+D9KwUbO1o08kC4zIFZoG2p/7I0D/g7gIjSn8CbDptZJxuZ8IzzV6wxayyoFl0xDxVudSw0PduyLBkaHm814eR/OVPK3VR+yn9M1btbQPoYFUpEuigoI1ufHztHaZWX+K4n0A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5f307e-245a-4fac-f7c6-08de3f62ce75
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 00:57:53.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wjojz4e1fQJlX6zIHfpYsPHz2P1KllZNPyagBHDoiEJV2HcLqKFFtZSIn4MsMPRBk4pkLDrlDr70ernzHzE1DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
X-Proofpoint-ORIG-GUID: 20tFMZHGEmNdgLjCMwR3rfO8qJFEANzd
X-Proofpoint-GUID: 20tFMZHGEmNdgLjCMwR3rfO8qJFEANzd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAwNSBTYWx0ZWRfX7yENk2pfMCUR
 R7sSjILqIG2T22K9XYTENJNq4q4brIMGQmWa24HYpl/VaG5DEdD8SRz0kaXN0R8gj84Pq0ip+uD
 q8CAjjPGb1lx5VMm0RFrXuvsy88OK1MvnNWRcf08YWgckWCeezGjowMC600l6TGNW5vnVjvsPmv
 N+60Trv1Iizkymj9sBXi6Wg8WOW3vwDS/n6vz4qlxH9njFxPXQHDCmhtcFMpTmkzqacsaTToesj
 /jYl/Coip9Ty91GKg2OC2bYWr8UPBOUpwjLYFbzCWr+2ddlk2uRZvIBwMwP5K2nBxlFSSeiuoIJ
 CC5PmBCv0nt86Hw20RQX7OPekZXYnrux5cHzPC2P466mMlhWFUjqoYMHgzPY331PP6NZxAhTtuu
 FCdbQm2gO87eI9+4bcBRzqSdUQNkHANtsk1ZWMHAi/3lERHpwkBfDJpyYwjWXFY4uVtFvbkQZCD
 3H0NbEGfR0tIcwG/U7Q==
X-Authority-Analysis: v=2.4 cv=K+sv3iWI c=1 sm=1 tr=0 ts=6945f49c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1XWaLZrsAAAA:8 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8
 a=30JwYrPmsRoxyaVUusgA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2512200005

T24gVGh1LCBEZWMgMTgsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IEFkZCBzdXBwb3J0IGZvciB0
aGUgRFdDMyBVU0IgY29udHJvbGxlciBmb3VuZCBvbiBHb29nbGUgVGVuc29yIEc1DQo+IChjb2Rl
bmFtZTogbGFndW5hKS4gVGhlIGNvbnRyb2xsZXIgZmVhdHVyZXMgZHVhbC1yb2xlIGZ1bmN0aW9u
YWxpdHkNCj4gYW5kIGhpYmVybmF0aW9uLg0KPiANCj4gVGhlIHByaW1hcnkgZm9jdXMgaXMgaW1w
bGVtZW50aW5nIGhpYmVybmF0aW9uIHN1cHBvcnQgaW4gaG9zdCBtb2RlLA0KPiBlbmFibGluZyB0
aGUgY29udHJvbGxlciB0byBlbnRlciBhIGxvdy1wb3dlciBzdGF0ZSAoRDMpLiBUaGlzIGlzDQo+
IHBhcnRpY3VsYXJseSByZWxldmFudCBkdXJpbmcgc3lzdGVtIHBvd2VyIHN0YXRlIHRyYW5zaXRp
b24gYW5kDQo+IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCBmb3IgcG93ZXIgZWZmaWNpZW5jeS4N
Cj4gSGlnaGxpZ2h0czoNCj4gLSBBbGlnbiBzdXNwZW5kIGNhbGxiYWNrIHdpdGggZHdjM19zdXNw
ZW5kX2NvbW1vbigpIGZvciBkZWNpZGluZw0KPiAgIGJldHdlZW4gYSBmdWxsIHRlYXJkb3duIGFu
ZCBoaWJlcm5hdGlvbiBpbiBob3N0IG1vZGUuDQo+IC0gSW50ZWdyYXRpb24gd2l0aCBgcHN3YCAo
cG93ZXIgc3dpdGNoYWJsZSkgYW5kIGB0b3BgIHBvd2VyIGRvbWFpbnMsDQo+ICAgbWFuYWdpbmcg
dGhlaXIgc3RhdGVzIGFuZCBkZXZpY2UgbGlua3MgdG8gc3VwcG9ydCBoaWJlcm5hdGlvbi4NCj4g
LSBBIG5vdGlmaWVyIGNhbGxiYWNrIGR3YzNfZ29vZ2xlX3VzYl9wc3dfcGRfbm90aWZpZXIoKSBm
b3INCj4gICBgcHN3YCBwb3dlciBkb21haW4gZXZlbnRzIHRvIG1hbmFnZSBjb250cm9sbGVyIHN0
YXRlDQo+ICAgdHJhbnNpdGlvbnMgdG8vZnJvbSBEMy4NCj4gLSBDb29yZGluYXRpb24gb2YgdGhl
IGBub25fc3RpY2t5YCByZXNldCBkdXJpbmcgcG93ZXIgc3RhdGUNCj4gICB0cmFuc2l0aW9ucywg
YXNzZXJ0aW5nIGl0IG9uIEQzIGVudHJ5IGFuZCBkZWFzc2VydGluZyBvbiBEMCBlbnRyeQ0KPiAg
IGluIGhpYmVybmF0aW9uIHNjZW5hcmlvLg0KPiAtIEhhbmRsaW5nIG9mIGhpZ2gtc3BlZWQgYW5k
IHN1cGVyLXNwZWVkIFBNRSBpbnRlcnJ1cHRzDQo+ICAgdGhhdCBhcmUgZ2VuZXJhdGVkIGJ5IHJl
bW90ZSB3YWtldXAgZHVyaW5nIGhpYmVybmF0aW9uLg0KPiANCj4gQ28tZGV2ZWxvcGVkLWJ5OiBK
b3kgQ2hha3JhYm9ydHkgPGpveWNoYWtyQGdvb2dsZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpv
eSBDaGFrcmFib3J0eSA8am95Y2hha3JAZ29vZ2xlLmNvbT4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBO
YXZlZW4gS3VtYXIgPG1ua3VtYXJAZ29vZ2xlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVu
IEt1bWFyIDxtbmt1bWFyQGdvb2dsZS5jb20+DQo+IFJldmlld2VkLWJ5OiBQZXRlciBHcmlmZmlu
IDxwZXRlci5ncmlmZmluQGxpbmFyby5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFJveSBMdW8gPHJv
eWx1b0Bnb29nbGUuY29tPg0KPiAtLS0NCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgICAgICAgfCAgMTEgKw0KPiAg
ZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvdXNiL2R3
YzMvZHdjMy1nb29nbGUuYyB8IDYyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA2NDEgaW5zZXJ0aW9ucygrKQ0KPiANCg0KQWNr
ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpU
aGluaA==
