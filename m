Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC10C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 13:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EB8561154
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 13:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241295AbhHENtn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 09:49:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53520 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238790AbhHENtn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 09:49:43 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AEEE7C3D48;
        Thu,  5 Aug 2021 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628171368; bh=ocgOPHqxjrc9XQhZBu8EKbg9lDvcrt4seQ9KZ65Gpu4=;
        h=From:To:CC:Subject:Date:References:From;
        b=gQZsjVUt89fJcj3sequ4k3jW+O1HprOygYsi1uSHMVk841ThAlt1ftgr0LR1TsLK7
         frBfZEdyWi+eRwPs2mJopnzX1IsvRn0jcWIbkg1JZf5ALr346cPA13j9IJF6ZUbq7G
         E06qoFMoZuTXPOqvkB9/erckaHUNkxfuTW9jIvaXFYLvEXbqwqk0mHfaHptkHoiBJh
         hlfKJcPtHDfAnTlq+31d6ygGwuhxLw12iIwJ5m+lXxjzPAhMcBWYolVJzvhsuK4aIB
         4K+e7N3BkXrRadjL/MHpGhJK2SyqgRn5n/i4Y34saZMHoxqoGL1x1O/pIz+b9xfK5v
         UM/rHsI3t7E4g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 41846A00D9;
        Thu,  5 Aug 2021 13:49:27 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 545004009D;
        Thu,  5 Aug 2021 13:49:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="U6TOZdqb";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWVOld+9bBLKTkcXpVL0/4yKBVRAN3rMGTtVULeAYGtmMRd4yvxAaGP3uQcrS0r6inQ9xjgTv7jnB6Op7kPmLDnTN9Z97NzmalupoDRKOu03JfpRFf7ipHufXqxANfKrxVxHy1Vql4cv5asnsrTP5igt6Z59vnKw31XiAxcDgEjj+JL4bdLtoic2oxw3hTwSqOGVJE1j09TAG4fxoplF7u7YstVJernNHc9gVHM8nLiDuo3/QesTGnnvJiSSwB8bzEdyFPzNpJ6tsmTHRAXP3kwe55eC4rMr5n6LUH+zoycwBf0XhJQHjTsYNSk11ToWFVod+rt3dXNkI9z9utrV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5qu5+17u/0VWKMIPhVIJQlbj/rq/0soB63Y+o61CTE=;
 b=igvKz1cniIqDoMkhHimsosRONm+EOx4pIenjkxSwZ7r9bxwQ8kqDbObtwZhmQz+AdAIRpYaFABy9tZJLb2b/PUJC01O52dhf66kXQnSf1zvvdE9ZcZS+sIj9TNKuXU421Lq87WrNP+ubRDBEuoLeBgskKtQv1GXUBRv9XEP0hhYjdZolhcNf5h8doWOmPY/QF+a7eumJkIoxAEdYsBbH9rYU9p0kSXEQdnVnqkjG27yKBGWpngdJ2xVPCwzHBSWUs9kQyK6wqQlGQLiPC/+XQ5/jEPLId7vgOsYKtV8AsiF9a3lN/p6J8RYFX5EjP/GwzS+/H3s8SQ/taSaz/V/WMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5qu5+17u/0VWKMIPhVIJQlbj/rq/0soB63Y+o61CTE=;
 b=U6TOZdqbmphewaKcUEd1+/X7xYQjRdLbd3KuTO0VlDPexcVDLdveOeh+qA+UYFDQ/E/A/darv637AqIamkqUFRitv1ZDTjI+tzU2Qe63sYhR7EfTUZtbVnYqOOoDryNhCDNY/AWv7dWhjDMQO01ziutE5sQmA+sfo2kfP0Q/EIc=
Received: from CH0PR12MB5265.namprd12.prod.outlook.com (2603:10b6:610:d0::22)
 by CH2PR12MB5516.namprd12.prod.outlook.com (2603:10b6:610:6b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 5 Aug
 2021 13:49:25 +0000
Received: from CH0PR12MB5265.namprd12.prod.outlook.com
 ([fe80::fd7b:1e59:44fb:44fd]) by CH0PR12MB5265.namprd12.prod.outlook.com
 ([fe80::fd7b:1e59:44fb:44fd%9]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 13:49:24 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc2: rename DWC2_POWER_DOWN_PARAM_NONE state
Thread-Topic: [PATCH 1/2] usb: dwc2: rename DWC2_POWER_DOWN_PARAM_NONE state
Thread-Index: AQHXiSYbmD399Z0pn0uw+0FNmkO/Sg==
Date:   Thu, 5 Aug 2021 13:49:24 +0000
Message-ID: <CH0PR12MB5265A61756A08A29362D8F77A7F29@CH0PR12MB5265.namprd12.prod.outlook.com>
References: <CGME20210804114433eucas1p134417b605abeb57728d358fc2f42162b@eucas1p1.samsung.com>
 <20210804114421.10282-1-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16e9c81c-dcd0-4f6d-3afd-08d95817d621
x-ms-traffictypediagnostic: CH2PR12MB5516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB5516C14F4ABC191975DD308EA7F29@CH2PR12MB5516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fkABB3HVlsqcmDetH0TDBGtEuWmKshm9AV+LfvBQGZN3b1R7uOZkZDjcYwI4+wdb9iFlMaYMA7U4x8YbF+oovyMUGi10yQTtVg5EZfzMSjRlZHi7Cer8J/d+Jt7KW/NJAffU4Hyq+pe3g13RYwcnIJYRCib7ngcBXmp82V+o8O2jyrMD0+qwKe4FJJYBAmWEX3yFIPD7EXtan/dxWes70LOrM3NnRS76lmBsiFA2lVp1dsit4xVQgDkjYNM8XEPgQsXWnoUMlDIxVSWue7lVOEWrjrpULTmI/f6Zp0CJ4ZIg5CnnVKrUnqzrt56evhBes0cT9jydkiEAiHqiNJ9ZhTD4XxBXQIjyuZVMldLKYZnlbUv3Dqd6tPBiqXYy9urErOedu6F7WjsgDHh7prz/tB/5GpjaJDXN8znKCLDjKbTWFhyU9RfhDScwryfG3g4TQufLsxm/+K8C5qyDQcX3hygtNtLypgb73LlNWVZLkYg13msP0zcolIGs/eeIlgu52E913oy7sLFrNnxH/5vcK2BuT8sXmbhSAq6Zx0GoBAEpkPY+8T0s8GX+ZrFuTYK1zNbL2fA99S6RfXGfVDpyk8a9BievbEkGe+h0mfEHySitUl6OAVQh7UW6nuQ06lsHYgiIkDqH3v1hem210e/eVjbZS6ZW2QEbz6jTJWYxlhUGnAxGhWlytxSg4vKGD1BXne8Lw5lwaHxTpTlBC6Cigbnb1OaozZtG+r3yrrYZrFNYWh37WfQLfCmh4238LaZAIFmi/7aByakOPRHH2FnjVuFdFL4O8ktvuqICUXn9dsQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39860400002)(396003)(376002)(55016002)(9686003)(4326008)(2906002)(7696005)(38100700002)(8936002)(52536014)(53546011)(6506007)(71200400001)(26005)(122000001)(33656002)(86362001)(83380400001)(5660300002)(478600001)(186003)(8676002)(91956017)(966005)(66556008)(66446008)(64756008)(66476007)(66946007)(316002)(76116006)(110136005)(54906003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s5nMrfu04ndN2JZsoMejBpzRWckMjyuXJFLMvOYm59WC6OZ1LM681/pSe4pB?=
 =?us-ascii?Q?UJTCY5qjqsLibCLepHVxP4lJrLxlcrgpR97uBGf6/w7Kcsm5Nb4EwyEX/v9y?=
 =?us-ascii?Q?26tEfs9vOBl5ZhTb4yWG+0zJZ0hArqe2CHX6dBMljUzRhcy/9BaU8u1Qj0LD?=
 =?us-ascii?Q?MN9Cliax5ahUpWm9MCoaPovzkgM/+ak5mcJ24idzCPmfMCwg1Nsh8lCWYfct?=
 =?us-ascii?Q?FUgihDDO49flmL1pKlyJLS7ZJwWeEqntO08xw2NJpV3vhR7sW1rDjBUikBLk?=
 =?us-ascii?Q?clWNdN61wVtt0bBM1jcawhjZyy3MWBc8dJzEtfQ0ybS6TLih7FWyjfKGkVET?=
 =?us-ascii?Q?C200vy/XALLvTox3VV76DnGgXTURIVY0MoneL3KTg5+4rrIxvg2wSJE+1DkT?=
 =?us-ascii?Q?wmMa+e1RdIDP7hLuh36utn9uxm3yXLD4Y3XwvKs6Wud4OJNsAFOx6L6q4Why?=
 =?us-ascii?Q?T5KOtl+LbnShF4KThWWxY3yny9SmCe8sV2VlU9dWAEioV5gF2jeXsnR4/upe?=
 =?us-ascii?Q?DnVZLk7mOa3BCq9B1m6XzqCwBwSo4ukaLbNPkbptskoW9IgNBO7i3rtO/6zI?=
 =?us-ascii?Q?nY4ANPy1y6XYY5DbkYAzUcl/bucK8N0VQbcI/v9IdBZAhrV23B59AgH/apz2?=
 =?us-ascii?Q?3rrL5uiTzgzg8zb/GbnrQ8vTCIOhLTe/g+0Wn9oCaOG8CLEzA5tD3wnukoSQ?=
 =?us-ascii?Q?G/Xu50grj5BhVG0WGaLVqANpWiaEuMDnyO/7Byz1Xsapvt6DYSadSvZrAXgT?=
 =?us-ascii?Q?7zYbqiEAcbuBcNfhy1NIOosWrsAntqOfUBsEVXUYrwP6JL7orORKTTYcsB2a?=
 =?us-ascii?Q?toBKoIMIvNy+lpnqpQfuWHdTyzxp8NYhgDKEM6JsRCwG274iud2YoMjI8CFA?=
 =?us-ascii?Q?XokGijVzjfDjRuTC58otLPsk0i+urhi0Lnb/d8GQdqrB3LB/b6aZmAk3HObP?=
 =?us-ascii?Q?RRTET4zZQRZjJSF1iVD4uk6pB/Ec8XS5lzwQpTRdcXiHUzt0XlbsGR2X6gBO?=
 =?us-ascii?Q?EIjO/FyatzAf9xvuEFBfcdJZ5l4NDseqCsOOEiWvY4Q5TOHIslYqzGc9dyB7?=
 =?us-ascii?Q?16eiNpuzjc6CVNovKkmYve12HdU0WzKU+Msirz+dO8Hy4WjGK+SUzWNG7R3O?=
 =?us-ascii?Q?DpYBVT5Wwd5GkrPPURh4RqlXoOuiyAc1vP4SlO/uj/DyrXm+Z8QmG1znPBEg?=
 =?us-ascii?Q?mbW/dvo3EM/CniGPBfTq9sFl4oE8ysOyTm570dejFg7wjPqizdQnKjuUVddl?=
 =?us-ascii?Q?XlGrQzzYHgGX8AdB+QZ+TjITBdUV8xl1tuWEkYr9Ac6WYU8Ss1fdTEg2XDff?=
 =?us-ascii?Q?294leVo+kZDabH0Cv6z69F/e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e9c81c-dcd0-4f6d-3afd-08d95817d621
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 13:49:24.8216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWOyCq/3tgSslIL10n/4obNkgxLL3Rju4BqdP45YAHkbP6tiCyvM6ZIxHz7ZRFsVINF9g58rQxVBJ/xVoyrWcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5516
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,=0A=
=0A=
On 8/4/2021 3:44 PM, Marek Szyprowski wrote:=0A=
> DWC2_POWER_DOWN_PARAM_NONE really means that the driver still uses clock=
=0A=
> gating to save power when hardware is not used. Rename the state name to=
=0A=
> DWC2_POWER_DOWN_PARAM_CLOCK_GATING to match the driver behavior.=0A=
> =0A=
> Suggested-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>=0A=
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>=0A=
> ---=0A=
> This is a follow-up of this discussion:=0A=
> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/26099de1-82=
6f-42bf-0de7-759a47faf4a0@samsung.com/__;!!A4F2R9G_pg!MIGkDa9hfT_3k8EATqQs_=
UYCb7yXMN18CC-gsrNOMI8NqZzAok3DZA6G04fgkS_4H52snpA$=0A=
> =0A=
> This should be applied on top of v5.14-rc3.=0A=
> ---=0A=
>   drivers/usb/dwc2/core.h      |  4 ++--=0A=
>   drivers/usb/dwc2/core_intr.c |  8 ++++----=0A=
>   drivers/usb/dwc2/hcd.c       | 10 +++++-----=0A=
>   drivers/usb/dwc2/params.c    | 22 +++++++++++-----------=0A=
>   drivers/usb/dwc2/platform.c  |  2 +-=0A=
>   5 files changed, 23 insertions(+), 23 deletions(-)=0A=
> =0A=
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h=0A=
> index cb9059a8444b..38b6733d26ec 100644=0A=
> --- a/drivers/usb/dwc2/core.h=0A=
> +++ b/drivers/usb/dwc2/core.h=0A=
> @@ -382,7 +382,7 @@ enum dwc2_ep0_state {=0A=
>    *			If power_down is enabled, the controller will enter=0A=
>    *			power_down in both peripheral and host mode when=0A=
>    *			needed.=0A=
> - *			0 - No (default)=0A=
> + *			0 - Clock gating (default)=0A=
>    *			1 - Partial power down=0A=
>    *			2 - Hibernation=0A=
>    * @no_clock_gating:	Specifies whether to avoid clock gating feature.=
=0A=
> @@ -482,7 +482,7 @@ struct dwc2_core_params {=0A=
>   	bool external_id_pin_ctl;=0A=
>   =0A=
>   	int power_down;=0A=
> -#define DWC2_POWER_DOWN_PARAM_NONE		0=0A=
> +#define DWC2_POWER_DOWN_PARAM_CLOCK_GATING	0=0A=
>   #define DWC2_POWER_DOWN_PARAM_PARTIAL		1=0A=
>   #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2=0A=
>   	bool no_clock_gating;=0A=
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c=
=0A=
> index a5c52b237e72..660abff1d42b 100644=0A=
> --- a/drivers/usb/dwc2/core_intr.c=0A=
> +++ b/drivers/usb/dwc2/core_intr.c=0A=
> @@ -327,7 +327,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_=
hsotg *hsotg)=0A=
>   =0A=
>   			/* Exit gadget mode clock gating. */=0A=
>   			if (hsotg->params.power_down =3D=3D=0A=
> -			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)=0A=
> +			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)=0A=
>   				dwc2_gadget_exit_clock_gating(hsotg, 0);=0A=
>   		}=0A=
>   =0A=
> @@ -438,7 +438,7 @@ static void dwc2_handle_wakeup_detected_intr(struct d=
wc2_hsotg *hsotg)=0A=
>   =0A=
>   			/* Exit gadget mode clock gating. */=0A=
>   			if (hsotg->params.power_down =3D=3D=0A=
> -			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)=0A=
> +			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)=0A=
>   				dwc2_gadget_exit_clock_gating(hsotg, 0);=0A=
>   		} else {=0A=
>   			/* Change to L0 state */=0A=
> @@ -455,7 +455,7 @@ static void dwc2_handle_wakeup_detected_intr(struct d=
wc2_hsotg *hsotg)=0A=
>   			}=0A=
>   =0A=
>   			if (hsotg->params.power_down =3D=3D=0A=
> -			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)=0A=
> +			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)=0A=
>   				dwc2_host_exit_clock_gating(hsotg, 1);=0A=
>   =0A=
>   			/*=0A=
> @@ -551,7 +551,7 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_=
hsotg *hsotg)=0A=
>   					dev_err(hsotg->dev,=0A=
>   						"enter hibernation failed\n");=0A=
>   				break;=0A=
> -			case DWC2_POWER_DOWN_PARAM_NONE:=0A=
> +			case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:=0A=
>   				/*=0A=
>   				 * If neither hibernation nor partial power down are supported,=0A=
>   				 * clock gating is used to save power.=0A=
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c=0A=
> index 2a7828971d05..067f2770c2ef 100644=0A=
> --- a/drivers/usb/dwc2/hcd.c=0A=
> +++ b/drivers/usb/dwc2/hcd.c=0A=
> @@ -3333,7 +3333,7 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16=
 windex)=0A=
>   			dev_err(hsotg->dev, "enter hibernation failed.\n");=0A=
>   		spin_lock_irqsave(&hsotg->lock, flags);=0A=
>   		break;=0A=
> -	case DWC2_POWER_DOWN_PARAM_NONE:=0A=
> +	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:=0A=
>   		/*=0A=
>   		 * If not hibernation nor partial power down are supported,=0A=
>   		 * clock gating is used to save power.=0A=
> @@ -3701,7 +3701,7 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *=
hsotg, u16 typereq,=0A=
>   			}=0A=
>   =0A=
>   			if (hsotg->params.power_down =3D=3D=0A=
> -			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)=0A=
> +			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)=0A=
>   				dwc2_host_exit_clock_gating(hsotg, 0);=0A=
>   =0A=
>   			pcgctl =3D dwc2_readl(hsotg, PCGCTL);=0A=
> @@ -4398,7 +4398,7 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)=
=0A=
>   		/* After entering suspend, hardware is not accessible */=0A=
>   		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);=0A=
>   		break;=0A=
> -	case DWC2_POWER_DOWN_PARAM_NONE:=0A=
> +	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:=0A=
>   		/*=0A=
>   		 * If not hibernation nor partial power down are supported,=0A=
>   		 * clock gating is used to save power.=0A=
> @@ -4482,7 +4482,7 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)=0A=
>   		 */=0A=
>   		set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);=0A=
>   		break;=0A=
> -	case DWC2_POWER_DOWN_PARAM_NONE:=0A=
> +	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:=0A=
>   		/*=0A=
>   		 * If not hibernation nor partial power down are supported,=0A=
>   		 * port resume is done using the clock gating programming flow.=0A=
> @@ -4680,7 +4680,7 @@ static int _dwc2_hcd_urb_enqueue(struct usb_hcd *hc=
d, struct urb *urb,=0A=
>   				"exit partial_power_down failed\n");=0A=
>   	}=0A=
>   =0A=
> -	if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE &&=0A=
> +	if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING =
&&=0A=
>   	    hsotg->bus_suspended) {=0A=
>   		if (dwc2_is_device_mode(hsotg))=0A=
>   			dwc2_gadget_exit_clock_gating(hsotg, 0);=0A=
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c=0A=
> index 59e119345994..dac26410b575 100644=0A=
> --- a/drivers/usb/dwc2/params.c=0A=
> +++ b/drivers/usb/dwc2/params.c=0A=
> @@ -68,14 +68,14 @@ static void dwc2_set_his_params(struct dwc2_hsotg *hs=
otg)=0A=
>   	p->ahbcfg =3D GAHBCFG_HBSTLEN_INCR16 <<=0A=
>   		GAHBCFG_HBSTLEN_SHIFT;=0A=
>   	p->change_speed_quirk =3D true;=0A=
> -	p->power_down =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +	p->power_down =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   }=0A=
>   =0A=
>   static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)=0A=
>   {=0A=
>   	struct dwc2_core_params *p =3D &hsotg->params;=0A=
>   =0A=
> -	p->power_down =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +	p->power_down =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   	p->no_clock_gating =3D true;=0A=
>   	p->phy_utmi_width =3D 8;=0A=
>   }=0A=
> @@ -90,7 +90,7 @@ static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg=
)=0A=
>   	p->host_perio_tx_fifo_size =3D 256;=0A=
>   	p->ahbcfg =3D GAHBCFG_HBSTLEN_INCR16 <<=0A=
>   		GAHBCFG_HBSTLEN_SHIFT;=0A=
> -	p->power_down =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +	p->power_down =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   }=0A=
>   =0A=
>   static void dwc2_set_ltq_params(struct dwc2_hsotg *hsotg)=0A=
> @@ -120,7 +120,7 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg=
 *hsotg)=0A=
>   	p->phy_type =3D DWC2_PHY_TYPE_PARAM_UTMI;=0A=
>   	p->ahbcfg =3D GAHBCFG_HBSTLEN_INCR8 <<=0A=
>   		GAHBCFG_HBSTLEN_SHIFT;=0A=
> -	p->power_down =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +	p->power_down =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   }=0A=
>   =0A=
>   static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)=0A=
> @@ -179,7 +179,7 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dw=
c2_hsotg *hsotg)=0A=
>   	p->activate_stm_fs_transceiver =3D true;=0A=
>   	p->activate_stm_id_vb_detection =3D true;=0A=
>   	p->ahbcfg =3D GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;=0A=
> -	p->power_down =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +	p->power_down =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   	p->host_support_fs_ls_low_power =3D true;=0A=
>   	p->host_ls_low_power_phy_clk =3D true;=0A=
>   }=0A=
> @@ -194,7 +194,7 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dw=
c2_hsotg *hsotg)=0A=
>   	p->host_nperio_tx_fifo_size =3D 256;=0A=
>   	p->host_perio_tx_fifo_size =3D 256;=0A=
>   	p->ahbcfg =3D GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;=0A=
> -	p->power_down =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +	p->power_down =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   	p->lpm =3D false;=0A=
>   	p->lpm_clock_gating =3D false;=0A=
>   	p->besl =3D false;=0A=
> @@ -339,7 +339,7 @@ static void dwc2_set_param_power_down(struct dwc2_hso=
tg *hsotg)=0A=
>   	else if (hsotg->hw_params.power_optimized)=0A=
>   		val =3D DWC2_POWER_DOWN_PARAM_PARTIAL;=0A=
>   	else=0A=
> -		val =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +		val =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   =0A=
>   	hsotg->params.power_down =3D val;=0A=
>   }=0A=
> @@ -585,27 +585,27 @@ static void dwc2_check_param_power_down(struct dwc2=
_hsotg *hsotg)=0A=
>   	int param =3D hsotg->params.power_down;=0A=
>   =0A=
>   	switch (param) {=0A=
> -	case DWC2_POWER_DOWN_PARAM_NONE:=0A=
> +	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:=0A=
>   		break;=0A=
>   	case DWC2_POWER_DOWN_PARAM_PARTIAL:=0A=
>   		if (hsotg->hw_params.power_optimized)=0A=
>   			break;=0A=
>   		dev_dbg(hsotg->dev,=0A=
>   			"Partial power down isn't supported by HW\n");=0A=
> -		param =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +		param =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   		break;=0A=
>   	case DWC2_POWER_DOWN_PARAM_HIBERNATION:=0A=
>   		if (hsotg->hw_params.hibernation)=0A=
>   			break;=0A=
>   		dev_dbg(hsotg->dev,=0A=
>   			"Hibernation isn't supported by HW\n");=0A=
> -		param =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +		param =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   		break;=0A=
>   	default:=0A=
>   		dev_err(hsotg->dev,=0A=
>   			"%s: Invalid parameter power_down=3D%d\n",=0A=
>   			__func__, param);=0A=
> -		param =3D DWC2_POWER_DOWN_PARAM_NONE;=0A=
> +		param =3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING;=0A=
>   		break;=0A=
>   	}=0A=
>   =0A=
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c=0A=
> index c8f18f3ba9e3..7bd8fb6c1378 100644=0A=
> --- a/drivers/usb/dwc2/platform.c=0A=
> +++ b/drivers/usb/dwc2/platform.c=0A=
> @@ -342,7 +342,7 @@ static int dwc2_driver_remove(struct platform_device =
*dev)=0A=
>   	}=0A=
>   =0A=
>   	/* Exit clock gating when driver is removed. */=0A=
> -	if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE &&=0A=
> +	if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_CLOCK_GATING =
&&=0A=
>   	    hsotg->bus_suspended) {=0A=
>   		if (dwc2_is_device_mode(hsotg))=0A=
>   			dwc2_gadget_exit_clock_gating(hsotg, 0);=0A=
> =0A=
=0A=
In function dwc2_port_resume() you didn't rename the =0A=
"DWC2_POWER_DOWN_PARAM_NONE" to "DWC2_POWER_DOWN_PARAM_CLOCK_GATING" and =
=0A=
also didn't add a case for "DWC2_POWER_DOWN_PARAM_NONE".=0A=
=0A=
In any case when we tested the patchset we encountered a problem when =0A=
using an external HUB connection to root HUB.=0A=
=0A=
If there is no device connected to the external HUB bus will be =0A=
suspended by the autosuspend. If this situation by connecting any device =
=0A=
to the external hub ports we don't see dwc2_port_resume() function call =0A=
and device remains not functional.=0A=
=0A=
Could you please perform the same test on your side and let us know the =0A=
results?=0A=
=0A=
Regards,=0A=
Artur=0A=
