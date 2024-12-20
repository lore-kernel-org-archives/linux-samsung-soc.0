Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020321A431;
	Fri, 20 Dec 2024 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734723723; cv=none; b=tcu/bf0qebPEJ5CX0Q1MDULfOUxKBU/GMt8XzJC7TyJtePwdYFhZqeWmsDapeVfnXwG0h6GSnE1rq/SXY3JET73ojJCMQs7oauPjVeXWglUoKcyX27eTIwpogOiQyOw8JtVd7qaNKQnOQg5w7M6olMlsflOIUqWftg5+ORfMvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734723723; c=relaxed/simple;
	bh=CxGn7Klj0NZdQ41qkc+OiHDFz7q57MzEMRCe/qwiymU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0R4rKo1fqBOQClKPd7kvHtfjT/Bcibfi0EcjxBSLfcC5JjrmDdvhVZiw12+M9fp9JVJBmp8HQ2V9ADplukXbuFCZz5/QJGjML2Aj5gjZT1mzKm/Yd08mNU6mT5L/sLEE9L+pAFUc50QabGPvI5NqTCu5IGM4Yl1XD+3K4h+EY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lt5IWLQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lt5IWLQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AB6C4CECD;
	Fri, 20 Dec 2024 19:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734723723;
	bh=CxGn7Klj0NZdQ41qkc+OiHDFz7q57MzEMRCe/qwiymU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lt5IWLQ1xcngwDOu5pq0XeOMh232j0L6VZGYBxEJTWjGu8/lfocZhtaJO9X9DJQfL
	 4PS/FBtvRLEl8KACH0uhdhlZ6ZC3tyTIlyP57RkYMDLJeuE6oqiYyY8eFgrhYq0E+j
	 gKWgr7ke+r2lq/CucEnF3dDuKeUcjdOwIEze4K/b2N9jV1Br26dJYOGEjEhQ+Jl1li
	 2+3U0lezZq/4FzoThBnVuGb3hJ7TwtTIbDlEwWhNfx6wZP0Q1ffBSGs2y5R2IuCd7M
	 TlbGQc33qLdjwYi7hyP/g1rXaLmJdQ9yPfaNq3eWXSCmX8THkEzfM8ahSf3620wceo
	 7hYgFfFGd4N7Q==
Date: Fri, 20 Dec 2024 19:41:57 +0000
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
Message-ID: <20241220-carving-diagram-a27c04aafb10@spud>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
 <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
 <20241219-strum-cheese-89e5e60d22c3@spud>
 <463d5955-a056-40e1-a46e-f89ac0dadccf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xx+aca69A1IHgTcv"
Content-Disposition: inline
In-Reply-To: <463d5955-a056-40e1-a46e-f89ac0dadccf@linaro.org>


--Xx+aca69A1IHgTcv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 07:51:32AM +0000, Tudor Ambarus wrote:
>=20
>=20
> On 12/19/24 6:58 PM, Conor Dooley wrote:
> > On Thu, Dec 19, 2024 at 03:42:11PM +0000, Tudor Ambarus wrote:
> >> Hi, Conor,
> >>
> >> On 12/19/24 2:11 PM, Conor Dooley wrote:
> >>>> There are mailbox clients that can discover the mailbox channel ID at
> >>>> run-time. For such cases passing the channel identifier via DT is
> >>>> redundant. Add support for referencing controllers solely by node.
> >>> I don't really get your implementation, why not just allow #mbox-cell=
s =3D 0?
> >>> That's what's done for things like fixed frequency clocks that only h=
ave
> >>> a single output.
> >>
> >> Ah, indeed!
> >>
> >> instead of:
> >> 	of_parse_phandle(dev->of_node, "mbox", 0);
> >> I can do a:
> >> 	of_parse_phandle_with_args(dev->of_node, "mboxes",
> >>                                    "#mbox-cells", 0, &of_args)
> >> where #mbox-cells =3D 0;
> >>
> >> Or ... can I pass NULL for cells_name and make the #mbox-cells property
> >> optional and still keeping its requirement of being at least 1?
> >=20
> > I think the mbox-cells =3D 0 approach is preferred, that property is wh=
at
> > marks it as a mailbox controller after all. Perhaps Rob or Krzysztof can
> > comment?
>=20
> I think using mbox-cells =3D 0 is better indeed. In my proposal I
> considered the list to always have a single phandle, thus a reference to
> a single mailbox controller, whereas it may be possible that clients to
> reference multiple mailbox controllers. If so, #mbox-cells needs to be
> defined in all the controllers, for consistency reasons, similar to what
> happens with fixed clocks, as you already mentioned.

Oh right, I had totally forgotten about that, that's a solid argument
for the mbox-cells =3D 0 approach for sure.

--Xx+aca69A1IHgTcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2XIhQAKCRB4tDGHoIJi
0sK+AQDCcx/lgCTv+Omz3fHAepr8BVUseHHBs+4WzmyKpR3V4AEAqX3itqXBhmyZ
9veirorpUjlotYZvKUMvTmoTRZswTgA=
=SG7R
-----END PGP SIGNATURE-----

--Xx+aca69A1IHgTcv--
