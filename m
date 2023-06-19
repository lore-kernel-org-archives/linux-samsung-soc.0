Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87727EB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Jun 2023 21:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjFSVQn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Jun 2023 17:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFSVQm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 17:16:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8A4DC;
        Mon, 19 Jun 2023 14:16:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C06E560EAE;
        Mon, 19 Jun 2023 21:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A1DC433C0;
        Mon, 19 Jun 2023 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687209401;
        bh=JBTWR99Q1eDNuEVibhcmNlst4vu0Z56hRZJoZoOhNwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ntsWACbUMlnuW5BSnHsZG2TTKeBnqu9hsRTu2DIbaC85MZo+lGwm6tnlfJ8J+7HM9
         elm8G1GjrejFg+VwKxcuqiQFN37K7ae5J7lxLKIBz39nVf4tA40IPNiVmFDP2LdOGS
         J9HwwI7Ci9S3Xp6IJuDchl8Nyj3BhSr3D+O0zRSBAIBUnB5E8uW4ZqzfbGmp6nW5AM
         2Wr4XOsUqqPhLxfvwTFsrrj098Qspkf3uPElDBmFpjQttojz2GxLSn0LO2897pFljV
         6tGr0YE4Nu5z+wbRNotqfHjARq6tLaliXmpnC2ONRZ4eHtpFBh3l84C+hEOwW+WqJR
         Bc8rxLL7U4PJQ==
Date:   Mon, 19 Jun 2023 22:16:37 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: samsung,s5m8767: Simplify excluding
 properties
Message-ID: <20230619-rejoin-brook-f878220ba872@spud>
References: <20230619101424.25897-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hmlYTsCCInqqIcWl"
Content-Disposition: inline
In-Reply-To: <20230619101424.25897-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--hmlYTsCCInqqIcWl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 12:14:24PM +0200, Krzysztof Kozlowski wrote:
> Mutually exclusive s5m8767,pmic-buck[234]-uses-gpio-dvs properties can
> be written simpler, with half of the lines of code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--hmlYTsCCInqqIcWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJDFtQAKCRB4tDGHoIJi
0iUCAP4i1Kjk0wc2dj0ZaaIq8QmB9iocPvRDHthhZumZnr0ePgD9Hqb8IWG9I42G
VOFA7KootLNN1/cXoX+wPZIFqtB0bwE=
=o6Lb
-----END PGP SIGNATURE-----

--hmlYTsCCInqqIcWl--
