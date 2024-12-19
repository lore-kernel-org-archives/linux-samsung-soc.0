Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3451A7265;
	Thu, 19 Dec 2024 18:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634714; cv=none; b=qgQnCjktrdwwAAPBIdN5RPrc81XPlkA9Fkiw0BNhjtknQyr0IFA456wDygZSiovVBXRQVuc5ID46/SBUiE+AKQwsnUA39z/Blpd4mKrOgFw6g9ZBcd4/NAyvAsYv+tZ6w1RZHHzD8VsvwyUiLbEZXBTipntE/6grnmbeSUPNTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634714; c=relaxed/simple;
	bh=5lJoFb1ogNkglTJoNJUT9Eg7QJAB+5pbzROZLHfkCpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMnSJRnm1R8vvkYrkkSKAhx5pcNSZsNF3pqbho4vbHMpc6PgoG/VTH5nbGW+fHFx8A02ecm2VvGs4OEUkZs+xvf3Bp4P4dOIHhTpqIafxhRBXmoH9dC/dvMuiWBOox5NbXYCy8OCYOqHh0E3EpT1aYo/9bBujvfLsO51ZOOLfe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lB0N5s/b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lB0N5s/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC152C4CECE;
	Thu, 19 Dec 2024 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634714;
	bh=5lJoFb1ogNkglTJoNJUT9Eg7QJAB+5pbzROZLHfkCpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lB0N5s/bKTVhnO7BJ8QaT49JXljtgwDxlfMye3BIVI1hOVMPL02R5XhntzwgLdfP8
	 udwDWZn5NeE0siZQLSGXI4LFIqaxvvzyVQLdmIbEHUXIPliojANnksZHWGPHsWYcJc
	 /u827GSe3Z26XuJU5ZSSCqvVC6zkZyRdK5mZG7hTnVr3h7/iW5bFTyBGreB9+CAt31
	 qVvOQ2Bsoef04MklW089E6u6XPHpom55P4/QEEZJIzRa2s6Mia0OgjVHBb+hlchkNj
	 mLYU7Y7S48T9sdIUfmJf/EIFo3BHExVhVKsbqxGh6VOM6A6TMVC9SBdrhEk39QNNhD
	 kMgqToinn3edA==
Date: Thu, 19 Dec 2024 18:58:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
	peter.griffin@linaro.org, kernel-team@android.com,
	willmcvicker@google.com, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
Message-ID: <20241219-strum-cheese-89e5e60d22c3@spud>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
 <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7uEMfKSFSh7bUHVr"
Content-Disposition: inline
In-Reply-To: <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>


--7uEMfKSFSh7bUHVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 03:42:11PM +0000, Tudor Ambarus wrote:
> Hi, Conor,
>=20
> On 12/19/24 2:11 PM, Conor Dooley wrote:
> >> There are mailbox clients that can discover the mailbox channel ID at
> >> run-time. For such cases passing the channel identifier via DT is
> >> redundant. Add support for referencing controllers solely by node.
> > I don't really get your implementation, why not just allow #mbox-cells =
=3D 0?
> > That's what's done for things like fixed frequency clocks that only have
> > a single output.
>=20
> Ah, indeed!
>=20
> instead of:
> 	of_parse_phandle(dev->of_node, "mbox", 0);
> I can do a:
> 	of_parse_phandle_with_args(dev->of_node, "mboxes",
>                                    "#mbox-cells", 0, &of_args)
> where #mbox-cells =3D 0;
>=20
> Or ... can I pass NULL for cells_name and make the #mbox-cells property
> optional and still keeping its requirement of being at least 1?

I think the mbox-cells =3D 0 approach is preferred, that property is what
marks it as a mailbox controller after all. Perhaps Rob or Krzysztof can
comment?

--7uEMfKSFSh7bUHVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2Rs1AAKCRB4tDGHoIJi
0nLvAP9ToMBHB4C3Rre2xvEvPhvlw39ZEfEZy++feDZz4E+SrAD+PHASE/M2kEJi
ylZ8oz0XIwxFixxF8qqyAlSnOzgynAs=
=RjlM
-----END PGP SIGNATURE-----

--7uEMfKSFSh7bUHVr--
