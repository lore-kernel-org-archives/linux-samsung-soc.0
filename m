Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF63A9615;
	Thu,  6 Aug 2026 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978704; cv=fail; b=qU1otrnUQuFQ2BCdnGp+bghypYWCtis6k++rWqc+X05ftNCEzewgKe8ImBMkqsuuiumYKPRXsVEYUkf7Sae6dHS+4EWITti09KptK+se68eEuYeMbznDmUq9yD2c6uW47lHdfh6tzQNecl2BddKYGlLDfEMsmVAY3RKiY8X7B9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978704; c=relaxed/simple;
	bh=aFFPIlhAeIROChDRf9VvJSrmIhQ9beqVeJ6/+GqtZ20=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s/cO6MQ/va2KtFH2G63SQ9CJUEhqPzVt7WYvQd5hxvwQt7uA1v7Lh2Yb/NBL2528Fp5Gnoa32IFd7rm/7libB7Ysj15G7fxNA7at3+0/kSYjH7jtJ9WPKSaaZ1QFhY+bX1WE9fK9IkMqm28mHMu/JMy5nuW2+nvOCBpBOsRlxpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZeXrHmv/; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZeXrHmv/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0RV3CjxU0pmzb0VXQSBkSD6+3ufKtTNIRbo4/T8WNBxMoRcy59nMENdjT31uaXde4ohVD6shpG/RDUwfkpV0vdGrJMtrTRzK/zoSy577wpQX8vVDkVBW/mZOynSRVeSmn2diGKQwhFJUdpdtbieiYlwuHZkyDwgd5TZfVMZ02c2dBIWixWVVeXPdllFeKRI1C0clZidXUGWsPMlj/oRlM/3/qVLwASTyCHc23xMN9hkl1VBDvCXOVE89qHcLaxVDE9TvLFdRXaNUiknQ3N8mHzHBXKZkW2WYTQcX6RICSj0taFE9fkvDqhiqGHqtYzHa0veKJpze9EGhAJuUnzDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bal3DF24tEuv9v68Mv6uRMQC+Qszsii4odcMK59YhOg=;
 b=m3A9xL0Xtrk+AODLrBfFfZiRnwR1fCe2oQ9JaXsK5l1QZDNYr11k1vE6N92TC0W7BZLDYiir9Qr3nnc4kVea9Te7iDtQb+FOVHemqHEH8M08nerzf2qB+b3Lz/LzeITjJz01QZa0wqNOQP7D+EQL30lb6riL9zgoMAkqBVD6lv2oNLM4vpl66L4gD/x2QxGB4Hg631SufhGeDKREDJBA1CRKy/NQM2b5f1DzpX6LEQnnrGc9vljO75VlE7lU3LG5mcw+bwJG/6ygBh4PuSJKVlx95xU9oU9c4Bc1eTtEu9SJwvK2Q01KTyP3l7DYWd1RfYhG+VFmhcgS7SImRiTUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bal3DF24tEuv9v68Mv6uRMQC+Qszsii4odcMK59YhOg=;
 b=ZeXrHmv/t7CM2Zgq4NRGup87ajrWTVvo8j3f55hPc1Rb2u9fHNJ3d4AofhrpHe44p45rZW6af3riEgk7ErvkopXPZRH2MPBxUrg/ySPg9aoM5dESudacV3P+zTBlBabkHaEL9Cp1fqqVy7BQsCHKidxZugSqHZE58XmVYz15q3VT07wXudGctoloJY4vBdcLJnKmv5rwj98AAQvgoW4zVwE1AdoVBmThVh7RWdlVXhNw5NsQQV1WqkyjIDXx0yzJVvggjdBSwE8AWk29a76+WtP5X0FtnLgkHjEUBdMvQfHwtOtigURH9UeBCxXK9Fh85YVlv66d5eqTnufkb6FrHQ==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VI0PR04MB12008.eurprd04.prod.outlook.com (2603:10a6:800:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 01:11:38 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 01:11:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Rob Herring <robh@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Dmitry
 Osipenko <digetx@gmail.com>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Heiko
 Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, Chris Zhong
	<zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, Sebastian
 Reichel <sebastian.reichel@collabora.com>, Andreas Kemnade
	<andreas@kemnade.info>, =?iso-8859-1?Q?Jonathan_Neusch=E4fer?=
	<j.neuschaefer@gmx.net>, Julien Panis <jpanis@baylibre.com>, Matti Vaittinen
	<mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>,
	=?iso-8859-1?Q?Andr=E9_Draszik?= <andre.draszik@linaro.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>
Subject: RE: [PATCH 00/10] dt-bindings: mfd: Use generic power-controller
 schema
Thread-Topic: [PATCH 00/10] dt-bindings: mfd: Use generic power-controller
 schema
Thread-Index: AQHdJBwqZOYUhgeTo0eopaQW6T3HuraP9ZQAgABCsEA=
Date: Thu, 6 Aug 2026 01:11:38 +0000
Message-ID:
 <MRWPR04MB12330DBC8F268BBD1118883FC88D22@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260805211054.GA1783131-robh@kernel.org>
In-Reply-To: <20260805211054.GA1783131-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|VI0PR04MB12008:EE_
x-ms-office365-filtering-correlation-id: 838e7d8c-41f8-4827-a91e-08def357aa9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|22082099003|18002099003|11063799006|56012099006|4143699003|3023799007|38070700021|10067099003;
x-microsoft-antispam-message-info:
 B3o3TiTYfeW35zbv46bUt2isnbu/C2IqSMOKXNlR9jqQeHEJk0u29KtaxK+GCGGU0NfKfvu6uo8tyGKNwIoRlUus3iozgXLNW3uk8kg8J21MuIAOGXpKwO+DN7+dgCh6jTk4h3csSXBXZFQrJSw+hiqSGAcbi4haIQxixIvfQPUSPviA4Sy+5I4truMfcNEBfco5X5ww3UU62w5zr1Yzw7Q+uTvOzkyctXcDFy05BtOqJn0rv5V/dN2uW30+mo2mZvUPIdiT8IZbPufGSlruFmYjroGRwmouF8ABsaMzWfrKnZ76P5yCYZEMVs473qeUkzQr/fwb6LMOTdaq51C0R7XnvSWIFIufoRhq446OIvp9eNeWWjk1fnrTJItrJrE7S6YVJFGoB4368nJ/0kWQVNWpamOj+vuZ9w21jhVBpmX0JK6fbB87G9AQtKAPPQ5LqS6rQPUutD7oQWOh5fZSeDTDXT1PcYWw2ff2FfzicyxmUpB/BZTkY3AA00ft4io3IenVbFnscCAhJAqfWXUEmg0bIZILELbomieeVAY7chMaBdevp93F4UH9a/YHdAup8mXi2PDUaOrmhef5aiYabbFc1WU42UwdVmcbf+oe1hAAPTUhLiFGpT7ymx7yMsHH4ira4Zujm21qR7DS85+968+Uk+5pcH79j0yt8MG+a2TBU5PyvthHU8zgUwQ5qmpa5W+fL/mNWV0Q7n9M2k3wiPVxC1fBD2gaSQh0DQD2aSU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(3023799007)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?908SaPwrspzDur6huYhdKZG12K9YmfVcq49kkUVaqg2LU0tfeToW57tMdt?=
 =?iso-8859-1?Q?zzBBMlotiCixQAm10hEbZLAoxrVYd3D8H6wFwKmPjzvPzvscMrKaZkdEAP?=
 =?iso-8859-1?Q?8yv/CrzVTDQLFAjYG7f89m2y1AVR+H+J76mADnPW9thzSv6n6q1VMHR2QE?=
 =?iso-8859-1?Q?vxXZn69eqOgoBGFKbm2csY/SeLXKwB1Ubae844MQXVfPijxfMLlfsmFEl0?=
 =?iso-8859-1?Q?73wn403zunNz3ZxjMyew9Sp02pA8xZGRvI7jEHRC0h7GveCn2K1POaAwBV?=
 =?iso-8859-1?Q?uSmV91HpY78FF2v4LAW5nfhnX0yqAZ56hdKXDhKwwcP/PFyvXEK/wEr4tH?=
 =?iso-8859-1?Q?T4w5gWgIjpoCsKT9lCX6Gvku7YLUmBpKOhzTdCvRgTBraLdpkX+YrB0BaJ?=
 =?iso-8859-1?Q?nIIYSy8f6PrzqV1wOB4a3VhFMfcpRRMp9jffk8X+HWZdG2YpOeWKWTciji?=
 =?iso-8859-1?Q?wb0flAAh7yILYCMPO/BWD1czJ2VqYZHlSmWUFCKZRKZN0qWH7koTrujqHU?=
 =?iso-8859-1?Q?lEGDIP9Stf2ipQSzvzp2Rjk63rnWBqryYZHuv8Bhd6gKGJMVhAR+lqOJ7o?=
 =?iso-8859-1?Q?flXOHmmDjKSA5zHizL5Q3lCOsGZljS/Z+KVCzKkC7uiuirTUCF3RM098UL?=
 =?iso-8859-1?Q?4AAhRu7Ou3jWHeiUlEo5Wjvsu909TmMYtXVbFYIoswCMF/wUH8o3GGzK5m?=
 =?iso-8859-1?Q?jy937YCDhFAOARSDhg0bgMd2tpZJoxVHYMQqQ7UzA4aG2UGR4SVM5JPiTy?=
 =?iso-8859-1?Q?LnpaWU7fBZ1dl2UGu8RSBrz8zl5T77qCNMU0wWa9g4BEVBM4Eb14r1ALyx?=
 =?iso-8859-1?Q?YEXYfEPleQhvnhVyAKJbKnBEp9pIQIUZavl83P5O7Sy4napYyeVGejiLXx?=
 =?iso-8859-1?Q?/rHzRB57fmp/Q+jta21vdWpcSV0ZIeJ6gEklNLPpLMjz1ez4Mp2BfHvAFY?=
 =?iso-8859-1?Q?Nwnxssm5UE/b6FUVpAA+k0KTB8yCxdWzx0YV951m5ybDcOLt+eT0jrx/nU?=
 =?iso-8859-1?Q?f2JA8Q3xmAD3MsVBrrLsCdjQuii6dMCMeYomYfGurGf9g3amLrhKd71Uzc?=
 =?iso-8859-1?Q?gbEJpGcX2VwyxpSEVUNf9VfVv24A9KYU2nd2xgjdra4Kwu4Mf0zy8DNa6W?=
 =?iso-8859-1?Q?HoeKxdJN7ig/eVdklrEcKs6vf6A8+Is2/W1OIYXob9mbjtfgnCgyKcez+Q?=
 =?iso-8859-1?Q?xbq5b/Za+WaJ4VbekOBIM/eA6Wm5O43i2EVyI+21hYdLuusSGd52+36SXd?=
 =?iso-8859-1?Q?9gAGzZkS5KpcV8uk8u+DY9f+Gc4Ahk64DURpe6Z8qH3IKcqb2GnWXrHltj?=
 =?iso-8859-1?Q?OoSOgbLwIThh1I8ECKAKtTXWueKBtOdag4c8jJSFRO84ahX1fRvMfQUByO?=
 =?iso-8859-1?Q?sKWkFvRus0Kdg9gRIjMbvfbK/NZxl1cGTS8dWrr5Pyvhy0SWWZn4oiezDM?=
 =?iso-8859-1?Q?KLzy1gXFh+U4Kao7X3zsOX+AweTWV5hhGkk/s92SDKq2PoLcsmhpcZoRxo?=
 =?iso-8859-1?Q?L6CgMmjzG9V/dSwdCWt7HXyFPH+fPNUJhdcsFntEqxQbr2PelomyFOTBJK?=
 =?iso-8859-1?Q?SwUhvPWrZiRqSKBobgIjJBWWCkmjXgXRvitY3w+KuZ5vXpfYYiNJS6H/fl?=
 =?iso-8859-1?Q?HIXazrj5vyrJLgOGwY2O/R9oHakd6/DDbYYf5DngT7SE7OqzVC70nWWz2h?=
 =?iso-8859-1?Q?mMEVFk+UlqDOdKq24SYxxdK4MUTOLiFwkVrJT4vGErgaiqL3uPLwgXErNB?=
 =?iso-8859-1?Q?6RwsO7ew3cXPAzNCLsp/NPB2Y7RCzOkyTQ1E9MlUcXrBqk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838e7d8c-41f8-4827-a91e-08def357aa9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 01:11:38.2799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GlWCekUsKJj7gWhT68C85utAHqVrfTCVHOb7hoeipG6tnP67n6kxk6Y4dzFP72H0X2tDonimHxnVVL4IBwbiYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12008

Hi Rob,

> Subject: Re: [PATCH 00/10] dt-bindings: mfd: Use generic power-
> controller schema
>=20
> On Tue, Aug 04, 2026 at 10:16:35PM +0800, Peng Fan (OSS) wrote:
> > The generic power-controller.yaml schema has been added to
> > dt-schema[1], providing a common definition for the
> > `system-power-controller` boolean property. Convert MFD bindings
> that
> > locally define this property to instead reference the shared schema.
> >
> > The common change across all patches is:
> >  - Add a $ref to /schemas/power/power-controller.yaml#
> >  - Remove the local `system-power-controller` property definition
> >  - Switch from additionalProperties to unevaluatedProperties
> >
> > This is a pick of patches 2-11 from [2], rebased to linux-next/master,
> > no changes. Patch 1 (the generic power-controller.yaml schema itself)
> > is dropped since it has already been picked up by dt-schema.
> >
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > Peng Fan (10):
> >       dt-bindings: mfd: ene-kb[3]930: Use generic power-controller
> schema
> >       dt-bindings: mfd: ti,tps65910: Use generic power-controller
> schema
> >       dt-bindings: mfd: rockchip,rk8x: Use generic power-controller
> schema
> >       dt-bindings: mfd: ricoh,rn5t618: Use generic power-controller
> schema
> >       dt-bindings: mfd: netronix,ntxec: Use generic power-controller
> schema
> >       dt-bindings: mfd: ti,twl: Use generic power-controller schema
> >       dt-bindings: mfd: ti,tps6594: Use generic power-controller
> schema
> >       dt-bindings: mfd: rohm,bd71828-pmic: Use generic power-
> controller schema
> >       dt-bindings: mfd: fsl,mc13xxx: Use generic power-controller
> schema
> >       dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic
> > power-controller schema
>=20
> Can we hold off on this until at least the next cycle.=20

Sure.=20

This change
> effectively bumps the minimum version of dtschema. While power-
> controller.yaml is added to dtschema, it is not yet in a released version=
.
> I'm not all that sure these changes are much improvement given it is a
> single boolean.

If you prefer, I could drop the patchset.

Thanks,
Peng.

>=20
> Rob
