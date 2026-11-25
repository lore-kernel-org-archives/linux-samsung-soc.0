Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795618513;
	b=GkhIxZU1GXScZtW2EPZiaSY6WvLl0aQmB61rOkEcKjFruy8hBkrYJsANxBbVa1NY3fGW
	 whixmKdD6fRZFhj7+chVlguEaLUK2yuCXflKtWoQu+IKdIX6FeEsPkXHAHXqqGzx7s7xd
	 MGQL7Ux+1tzVyicQtpqo0nMLljzA8DzLQXsr7meCEuK1i/sLAnvcbJ2Q9mvOwlijkRHWR
	 l89H9wmJIz6yVzIwANHvQlRHjT8GKPTaAWSStaEphSXvN+SyQeE6YUKryTbr3Sgg7XcS/
	 BuCaqHnDYZPTy5ycxX2wPNcHTzHraZQ4swYAilPi093B0apI6BYaBd2gXemliusz4wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618513;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UVfZCnCS1lfKWlAQxCT2m4GZR6ZyKOxu8kvt/BZqS5Y=;
	b=FVln63manYi3qJIpabtg47HPqGoXhfGOhqOfQfTQLD81OfcAmWxGFC4MeZ6+PaxrOFEb
	 X6rvIl/elUtLei1rp17PjOlCP74KbCwvuBZHtiR8X8b7DqbG96bWZkr5FC3Tthq39heai
	 Gx5Twxf9qWcVNnKzIRwmXrUJKEqJgvsmwG05ZxXS2VKhKJduMF26fViAkAwC4U9ra7caB
	 zI8ZAKCSs5I8crw3o0WgezwNshK555BR+lc8fCo5g58TqqPUrCcoeHurcaYATan6aSFBq
	 2r34HKVOlSfxaWjhhsIu9McyRTtUa91l15+c2dAFevkv+S2ZezWkLEpuJTg8AAizyog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j8HOzmRL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.35
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013035.outbound.protection.outlook.com [40.107.162.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C1B606A321;
	Wed, 25 Nov 2026 14:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j8HOzmRL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t65I6Sq63mygC2gF3j3ExHLYXAkORyza530HN/vVJY4ogIra4r7+wFuIAj4LSEYkdkdVsBJRpjXKyYfZ0f0M5kUmwV+9efmPbbymkkL8w4sGZ7XsbAwSg0g8bNIruZAr1E/lK8end2qXMDg8LSvtI8uavk/Fhop4tvpP8e1KL3MLw/egH2y4pJKYeTNosWnUdxOLEbXSBzbuD4ttSru8bQ5QV30raipXe6DbVyuJJdSxzKwsQASG63nfYhslqyKUJ6d+7OtIL+00T1GFC1TC1rUthOJwtfLNtp3ji8yTqr5ncyP8HFvcjqHTRgEY1GdX63wdfyxOfcNFd8hLxUshhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVfZCnCS1lfKWlAQxCT2m4GZR6ZyKOxu8kvt/BZqS5Y=;
 b=XkhDCzQajR8G8rG4CaquHcvyD/yI8Glz6T2LDZFFwMoSGuztfVi7hGYanon0OviyidB1CqAvkNLVv7heNumsHowFf1uFnZ+EnnMbOxE9QbZDtSVv3gY39d3233nP9WU4zggzharjAWwS+SxldoZt2OYy2s90WMk+2HwqQxPwDlO4qJwe32VvFBQlYMr6Af8DnsNZ90r02aoXCW1LnJYwpQUS2rJJ2+J7xLyV1Grp8ghvJQcrLbXl3VZZSGzZlgBbxqAncP9t9GTDST0sq7n8yl4OSkxItCSH/EsfjepbJrERCZPsH6CulLgwkjRtew+rFQKXHP+kvc2TbCLh5xRusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVfZCnCS1lfKWlAQxCT2m4GZR6ZyKOxu8kvt/BZqS5Y=;
 b=j8HOzmRLbX1Xd6Rm9BNIAo2ZIWvJAnBpWD8rJIpMObyafRpNv7/RU+NjQa4nYiumwmWv6k/9kdzTORyg/xpdSMca3ms1OomNS52H5LXAXmMa6pkfgTd7Cox1Noo/SyTIkbMGewKhOGijqf6KaeOhDDx5bFXubkJAM4FaFCvVE/anhJYxcaiXC/BU4kEmMGXkXMyrPK76vxUXlOqqYJnR1gKsJGMYrZ7HZYJL5I3mwgB6ZteNh+gRrY4eBvTaZE9XozyG/E/gRiH/+JqTDkzhV/3jLYzqX6D3UNwv9glVoK79xQGd1XpE6yk9SkoT/2qjRQSGOL1DkIxKmB/JLsAGCw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DUYPR04MB12666.eurprd04.prod.outlook.com (2603:10a6:10:65f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 14:55:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:55:07 +0000
Date: Wed, 25 Nov 2026 09:54:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neal Gompa <neal@gompa.dev>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
Message-ID: <awb2woyxkeXBU6xB@lizhi-Precision-Tower-5810>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
X-ClientProxiedBy: PH7P220CA0061.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DUYPR04MB12666:EE_
X-MS-Office365-Filtering-Correlation-Id: 132697d7-1b48-41bc-3c5c-08df4b04188a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	V/HTfwrL1aPkKp68qnKA21w9O7RaKPF+KKrP4L3/e9SBphnaaGQcuoymFRWoxj9E4iZMW0xzeYeBCx2ao73RJkqjX/+Jy0jblTAl33ef9vFkLSvTBYAnmOG+BW4Z+P0cUsBDIq788U99gOBSKnAlC0gStPZ3OIhFEXtaYwoxnCtkPdaYs901K9Gi35QeaNyFaXLzAdD0aVAQ3vEHq8vdisf0l+cGPWPSnFwouOCI9aPdKWBoJYAaQc47gFuaA6ZFY/AOg01Pa7eEo5mNnIFYyoWl2MkCEp56NkSt4eJel/nry/K68lcPelFH2MmjbFI8mlkvGQuwE58oEakohGspPvz02PDsAIaOzPJwIm0EOpgVu+YYnvIWn1yHLLZLE6W29ZHBQWdIlrcWnIdJJWr7AkJiw03FvXP5YNrOmkHoMVA8UjCVzopHhuWK+D0MfPkGL8zKYDDQQ8sRCbYG1Lxf9PRp/R2OuMNEwqfgVfw6/C8QhpQOE2FsMgkGgKqu+S9BS48whjsHrBtR9cMErm8N4/xqvtcLcZF5NvhFoePjpteLZzu47KehgSGoVCRlCFX8ZHUoXLJJZIy13EdpnmYpBumLBlZJesFAm8+8Qr3Vg7vPq3P6HkhVCoEUde1+PK34Ls5VS/60slgShyIVYIoc5S7djMD7iorFBsosNhJTOx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TPhZ+Fh1BrgkG4QYF52RCiG7Ajccj+UE/0TT3jFKrb0SjdJldlYb9Ba1R7RJ?=
 =?us-ascii?Q?0RUZ2NjnnapgBL6yEfQdlCwEA2TWhiaU/tdAZJluruS8PPW4IXIe0gT+2G/0?=
 =?us-ascii?Q?FdWFJA5x6mANQ+sdhUHUyhjW/wrjCE+te+jIBg+E/GHoUnWdLaVw1vbbbOdb?=
 =?us-ascii?Q?V7kMZhXPIirShPoJLHk/R/x+fPRLO8Ro0kxLkIM0UIPMHze1E+tzGeTvBjyk?=
 =?us-ascii?Q?WPvCJZ/zjNQN21V8kSrByH/ekXA542zvWkxEb15f41X4VzH3mlqyO2IPwj4K?=
 =?us-ascii?Q?FLxEvjwLvN6Kml7kFFmymPxXz+MnFh+T35XkC+OyCbCSLJsrGUqekwbh7mHB?=
 =?us-ascii?Q?UquGax9XqkNhu/vEqb94sNYzOFste0PrihBYNAM4NDnnuAvLPc7VV0xPo42X?=
 =?us-ascii?Q?ogJAXZO33cGRs7e5tZXwsnVOxEuM8JlSdCVcomzV4dEpRneYGZq6cQdfTbNp?=
 =?us-ascii?Q?mVVUzald06aw3dth8xEzqlf3x3Bql4jQJtn+7O4aXzp+9l6SpHMJTswUIf2J?=
 =?us-ascii?Q?2JH5tYI6riGKri+HZ4SFeBAr78A3uOK43FRJf8Vvg3fbTxDTCGa7Ku4TJlxV?=
 =?us-ascii?Q?JYgcfoAQb0fQL1yGxi4weXc11hGISg9ctLAvjYcum8vWu5Kc30DMyTMCdbWJ?=
 =?us-ascii?Q?nFsBuyMHgW6XFdBuLs4AQdCjDI+5MK9kgC4R8AlLttcuoBsxNczO0i1jZ2dj?=
 =?us-ascii?Q?+DMdICELVgxJwsr2HIeEHv8EFrJOy4SzzhI+nIRIxncDke5NITI0A1XAoql1?=
 =?us-ascii?Q?3dMBlB4l8ncqp9MMYpMvAximZVln77xWnh+fOA4BWsYCc+fGSff3N+OO2K2a?=
 =?us-ascii?Q?6/yehgxsfJ7ubFW7IvUQJyVP5W8ocN5B2nH5Qyc2C/p+H61zHRFbTMPNk/Pi?=
 =?us-ascii?Q?LHk0p0a0HQkjI035WdoEF2qEomPv0boHgCEfI3lTLpP3bvrBP1iTHWMEG4Tu?=
 =?us-ascii?Q?R6asI4dM5jTMdl4wC2wN7lw2HodfA6uZ7wLx37gxaXlK1XISmsTceTQoFCK5?=
 =?us-ascii?Q?d3aByUdNkWmw9/TK4tkx25OXeLJGkxgN/iMmqm+qIcDe7HPs/toGyyvpOG+V?=
 =?us-ascii?Q?codqz2zjZVciFJOCNfLJzP6opK3SrQisCMhyjiZezNI18/3oo7Th4fJnLukP?=
 =?us-ascii?Q?2V77IxnjEKWhRNnh3MfBjlCAoHPl674dmzjSvjl1/eHr9BBtgKLBnXhQNUnN?=
 =?us-ascii?Q?fXTej/TWMgwgCAHN/Uwo8aq3hAHt8QvufRJXAEWI2R4VXFeg0YZbkRnaRCE6?=
 =?us-ascii?Q?sEsW9tbOI/vWnp/cZvRKwljOtane1X1neoK4hjrEP05vfRUdZVR1yh8XfoOu?=
 =?us-ascii?Q?GyDZMxMQ9BJazHjnEtMivcino+sWAJOxoLWj8iMaKEf06tDaVLe6yFPzMu3c?=
 =?us-ascii?Q?tE6+dveahbqDgTy3sm2OFl+N9ljt4DIOSAcypwJKyqWGHmUNF9isKkJB679C?=
 =?us-ascii?Q?V5cZ1PlhXILvIPDmH/01w6SZLJpfI5ykfNZsAfi1060b6wBYpzgFphaqXYSN?=
 =?us-ascii?Q?wMOz/8T4rIl7VQRQ1BIU4V3EU/VDb/Kh7+E1DXmxzGL7GxIT5OEcUSVnTP7n?=
 =?us-ascii?Q?/xX3hpiRyMjOB5ucSvFI5stg4OUcrYK4fDGewseRpChxwBzAkP7mTNVNIoBX?=
 =?us-ascii?Q?0pAdEZisCPOHKdvwAPhlWrEy+HySmANEU/AjA+zMk8eKXpP+Dm9NJ1bmzaux?=
 =?us-ascii?Q?Vlq1PNofMHr25nMBvB7U9rDLps3uW5PXRhh+JS92Fa0kQOYACnkX4GyDrwow?=
 =?us-ascii?Q?7mZP/yWArtQxRT0lNVonamcXNQtoW5EhGMiGktudftpEX4uGWQIF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132697d7-1b48-41bc-3c5c-08df4b04188a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:55:07.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+gKpXyWDphR4aLoLJlZeFWoR0xavRNAc5OL4PJ7+l2BX+7uPcPx1ruqcmaG1JPo2R02qKg/vTVDU2E6HceoJJXGTCdYe2eYbq96g2XSll1bq51xidlXJhB7KkO+VSoF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12666

On Tue, Nov 24, 2026 at 10:59:31PM +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/dwc3/core.c              | 18 +++++-------------
>  drivers/usb/dwc3/dwc3-apple.c        |  1 -
>  drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
>  drivers/usb/dwc3/dwc3-google.c       |  1 -
>  drivers/usb/dwc3/dwc3-imx.c          |  9 +++++++--
>  drivers/usb/dwc3/dwc3-qcom.c         |  1 -
>  drivers/usb/dwc3/glue.h              | 10 ++++------
>  7 files changed, 27 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 3b2b5fcc627a..369c9ce9f1dc 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1684,24 +1684,14 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>  	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, true);
>  }
>
> -static void dwc3_get_software_properties(struct dwc3 *dwc,
> -					 const struct dwc3_properties *properties)
> +static void dwc3_get_software_properties(struct dwc3 *dwc)
>  {
>  	struct device *tmpdev;
>  	u16 gsbuscfg0_reqinfo;
>  	int ret;
>
> -	if (properties->needs_full_reinit)
> -		dwc->needs_full_reinit = true;
> -
>  	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
>
> -	if (properties->gsbuscfg0_reqinfo !=
> -	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
> -		dwc->gsbuscfg0_reqinfo = properties->gsbuscfg0_reqinfo;
> -		return;
> -	}
> -
>  	/*
>  	 * Iterate over all parent nodes for finding swnode properties
>  	 * and non-DT (non-ABI) properties.
> @@ -2310,7 +2300,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  	dwc->regs_size	= resource_size(&dwc_res);
>
>  	dwc3_get_properties(dwc);
> -	dwc3_get_software_properties(dwc, &data->properties);
> +	dwc3_get_software_properties(dwc);
> +
> +	if (data->fixup_properties)
> +		data->fixup_properties(dwc, &dwc->properties);
>
>  	if (dwc->sysdev_is_parent)
>  		dwc->sysdev = dwc->dev->parent;
> @@ -2470,7 +2463,6 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	probe_data.dwc = dwc;
>  	probe_data.res = res;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>
>  	return dwc3_core_probe(&probe_data);
>  }
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
> index 1f474a8bc59e..8289d22e5994 100644
> --- a/drivers/usb/dwc3/dwc3-apple.c
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -181,7 +181,6 @@ static int dwc3_apple_core_probe(struct dwc3_apple *appledwc)
>  	probe_data.res = appledwc->mmio_resource;
>  	probe_data.ignore_clocks_and_resets = true;
>  	probe_data.skip_core_init_mode = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index 3e90ddf25809..69a6acd84a0f 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -33,7 +33,8 @@ struct dwc3_generic {
>
>  struct dwc3_generic_config {
>  	int (*init)(struct dwc3_generic *dwc3g);
> -	struct dwc3_properties properties;
> +	void (*fixup_properties)(struct dwc3 *dwc,
> +				 struct dwc3_properties *props);
>  };
>
>  #define to_dwc3_generic(d) container_of((d), struct dwc3_generic, dwc)
> @@ -137,12 +138,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
>  	probe_data.ignore_clocks_and_resets = true;
>
>  	plat_config = of_device_get_match_data(dev);
> -	if (!plat_config) {
> -		probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +	if (!plat_config)
>  		goto core_probe;
> -	}
>
> -	probe_data.properties = plat_config->properties;
> +	probe_data.fixup_properties = plat_config->fixup_properties;
>  	if (plat_config->init) {
>  		ret = plat_config->init(dwc3g);
>  		if (ret)
> @@ -220,16 +219,20 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
>
>  static const struct dwc3_generic_config spacemit_k1_dwc3 = {
>  	.init = dwc3_spacemit_k1_init,
> -	.properties = DWC3_DEFAULT_PROPERTIES,
>  };
>
> +static void dwc3_ls1028a_fixup_properties(struct dwc3 *dwc,
> +					  struct dwc3_properties *props)
> +{
> +	props->gsbuscfg0_reqinfo = 0x2222;
> +}
> +
>  static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
> -	.properties.gsbuscfg0_reqinfo = 0x2222,
> +	.fixup_properties = dwc3_ls1028a_fixup_properties,
>  };
>
>  static const struct dwc3_generic_config eic7700_dwc3 =  {
>  	.init = dwc3_eic7700_init,
> -	.properties = DWC3_DEFAULT_PROPERTIES,
>  };
>
>  static const struct of_device_id dwc3_generic_of_match[] = {
> diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
> index 67eda7f0d528..213c03048aa0 100644
> --- a/drivers/usb/dwc3/dwc3-google.c
> +++ b/drivers/usb/dwc3/dwc3-google.c
> @@ -440,7 +440,6 @@ static int dwc3_google_probe(struct platform_device *pdev)
>  	probe_data.dwc = &google->dwc;
>  	probe_data.res = res;
>  	probe_data.ignore_clocks_and_resets = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> index 64da121a8f76..396d76311120 100644
> --- a/drivers/usb/dwc3/dwc3-imx.c
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -192,6 +192,12 @@ static const struct software_node dwc3_imx_swnode = {
>  	.properties = dwc3_imx_properties,
>  };
>
> +static void dwc3_imx_fixup_properties(struct dwc3 *dwc,
> +				      struct dwc3_properties *props)
> +{
> +	props->needs_full_reinit = true;
> +}
> +
>  static int dwc3_imx_probe(struct platform_device *pdev)
>  {
>  	struct device		*dev = &pdev->dev;
> @@ -265,8 +271,7 @@ static int dwc3_imx_probe(struct platform_device *pdev)
>
>  	probe_data.res = res;
>  	probe_data.dwc = dwc;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> -	probe_data.properties.needs_full_reinit = true;
> +	probe_data.fixup_properties = dwc3_imx_fixup_properties;
>
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret) {
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 5a68025ccea5..ef38308023aa 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -745,7 +745,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	probe_data.dwc = &qcom->dwc;
>  	probe_data.res = &res;
>  	probe_data.ignore_clocks_and_resets = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index b7ce196e84ea..e56fee68e4bc 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -9,10 +9,6 @@
>  #include <linux/types.h>
>  #include "core.h"
>
> -#define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
> -	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,	\
> -	})
> -
>  /**
>   * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
>   * @dwc: Reference to dwc3 context structure
> @@ -21,14 +17,16 @@
>   *		be ignored by the DWC3 core, as they are managed by the glue
>   * @skip_core_init_mode: Skip the final initialization of the target mode, as
>   *		it must be managed by the glue
> - * @properties: dwc3 software manage properties
> + * @fixup_properties: optional hook to set or override properties after
> + *		the core reads them from DT
>   */
>  struct dwc3_probe_data {
>  	struct dwc3 *dwc;
>  	struct resource *res;
>  	bool ignore_clocks_and_resets;
>  	bool skip_core_init_mode;
> -	struct dwc3_properties properties;
> +	void (*fixup_properties)(struct dwc3 *dwc,
> +				 struct dwc3_properties *props);
>  };
>
>  /**
> --
> 2.53.0
