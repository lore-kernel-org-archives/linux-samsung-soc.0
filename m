Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52818C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 18:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CA1A6101A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 18:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhJHS4s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 14:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231245AbhJHS4r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 14:56:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF77660FE8;
        Fri,  8 Oct 2021 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633719292;
        bh=OCjFcYtXV9VmvbrrMh6xIgEsO25gV+OonbNdf6SMcYg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HYPkQcHNN89Ad8QiqnemDCln8WiGS+jcaEQSAKfLoZb9Ai8GAIpRGGv6usPZGyvVN
         OzG8OL3V6XvzeO/+j/eiFB+Jyde4aWawYO8+7AXEskvqqM//E1Rfz/FhwRONqrogq9
         jQshDvQ2072HEdXpc9j5dnlLi5jLU3M/1fDCupMElbYIMi/2XFrbcx6ovnG6RJbnby
         Ks4NtFDIraJ8PbqhcWbuzfxqJtbYxLpw0Wf6oq4a1fWnP09KQN3SgzpkaFCQEJ4DLH
         NGb+IhbcFoW00IgKg1VMOqUuchALTiIzNuctGalo1ebQ5ThFOqQGRrNwfWkLXRVRRk
         sXEZ0nO2sm2tg==
Date:   Fri, 8 Oct 2021 19:54:49 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v4 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YWCT+YL/9qHbF9f0@sirena.org.uk>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nQeE6YCzVS6ygCoV"
Content-Disposition: inline
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
X-Cookie: When your memory goes, forget it!
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--nQeE6YCzVS6ygCoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 08, 2021 at 01:37:12PM +0200, Krzysztof Kozlowski wrote:

> This patchset converts all devicetree bindings of Samsung S2M and S5M
> PMIC devices from txt to dtschema.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/s2m_s5m_dtschema

for you to fetch changes up to fab58debc137f66cf97f60c8471ff2f1e3e1b44b:

  regulator: dt-bindings: samsung,s5m8767: convert to dtschema (2021-10-08 17:24:37 +0100)

----------------------------------------------------------------
regulator/clock: Convert the s2m and s5m DT bindings to schema

Tagged to allow further bindings to rely on these.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
      regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
      dt-bindings: clock: samsung,s2mps11: convert to dtschema
      regulator: dt-bindings: samsung,s2m: convert to dtschema
      regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
      regulator: dt-bindings: samsung,s5m8767: convert to dtschema

 .../devicetree/bindings/clock/samsung,s2mps11.txt  |  49 -------
 .../devicetree/bindings/clock/samsung,s2mps11.yaml |  45 +++++++
 .../bindings/regulator/samsung,s2mpa01.txt         |  79 -----------
 .../bindings/regulator/samsung,s2mpa01.yaml        |  62 +++++++++
 .../bindings/regulator/samsung,s2mps11.txt         | 102 ---------------
 .../bindings/regulator/samsung,s2mps11.yaml        |  44 +++++++
 .../bindings/regulator/samsung,s2mps13.yaml        |  44 +++++++
 .../bindings/regulator/samsung,s2mps14.yaml        |  44 +++++++
 .../bindings/regulator/samsung,s2mps15.yaml        |  44 +++++++
 .../bindings/regulator/samsung,s2mpu02.yaml        |  44 +++++++
 .../bindings/regulator/samsung,s5m8767.txt         | 145 ---------------------
 .../bindings/regulator/samsung,s5m8767.yaml        |  74 +++++++++++
 MAINTAINERS                                        |   6 +-
 drivers/regulator/s5m8767.c                        |  21 ++-
 14 files changed, 413 insertions(+), 390 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml

--nQeE6YCzVS6ygCoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgk/kACgkQJNaLcl1U
h9ANlQf9F9iwyk/4j9qhMwgy2WTrD5ykcCwkbE3j5zbzlyGr+aP6AdHBHDP6iz+I
OyJQlrNlf1e2qzev6SPdXpACZNHpuD2P6XGsAEyutYEPKHzzgU3ctlx5xz37TCIf
axIOo0uUQG8ctHdEELumCZuu29IyU18V0taD89dOJX+ccAEzFNWKVjX6a8JBJvS8
YGoKyGLb3Dk0ZbZeIm6clebYL3KclS3EQMzK3n8gP6+k2xkOjVgdisQzSDrO+Lma
KotSMRN/3FixZvH76efC2pcTqjsAbPeeJAF0RJWLrHKth/HW0EiRXbkV+iLg5loO
w6SQnPzY2IAKNMaMo2S9b4WvkUCG/g==
=PWIk
-----END PGP SIGNATURE-----

--nQeE6YCzVS6ygCoV--
