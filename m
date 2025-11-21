Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17034AB12;
	Fri, 21 Nov 2025 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732737; cv=none; b=WjXGRQMeeeEt78Plt6nB2983cGgmcz5qgKUcdh92qozD6V3+6ZMNbEdrhoHmuTAmHG4ZY68cUptNjxrIwHvY2oc3Ny62kbPydEtgv8jKx9bNONKu9f1rhJBJ80PCxqOdyQNv8BUqttg1Om3zZo0bGm+/rdrzhqgCmkkscZQwASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732737; c=relaxed/simple;
	bh=pkEhB1z/yBfx/Q1It2/9tQfikBIEO5wl2VmkUiqSOfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0xJIUOcuAKk5Q79/U8Z9nFRT3bVpOFN3KNH/1//8P9FeXaKN8UqrmslhiLojbTqPQE0DwmpdoPJ5FRUfgps3xBip4zandYIULBF79fwAdXT4Ux+ovK0ITkvxSnvC44pXjUmg64sOMI8M9/sYEkAukedpdwSn6WRNgJeDtl36p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dCc112TK1z9tKs;
	Fri, 21 Nov 2025 14:45:25 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Fri, 21 Nov 2025 14:45:20 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
Message-ID: <zgyxb6jqfvfr6iah4lw7rvweextbwxrtlysap4dfzeejqgulwo@ik25opshvwxd>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
 <20251121-convivial-wren-of-wind-cefe21@kuoka>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-convivial-wren-of-wind-cefe21@kuoka>
X-Rspamd-Queue-Id: 4dCc112TK1z9tKs

On Fri, Nov 21, 2025 at 10:04:43AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
> > From: Alexandre Marquet <tb@a-marquet.fr>
> > 
> > Add the Google Nexus 10 board to documentation.
> > 
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > index f8e20e602c20..97a5a678f43c 100644
> > --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > @@ -120,6 +120,7 @@ properties:
> >                - google,snow-rev5                # Google Snow Rev 5+
> >                - google,spring                   # Google Spring
> >                - insignal,arndale                # Insignal Arndale
> > +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)
> 
> Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
> 100% sure that Samsung and Google are two different companies. Google
> products use only google prefixes, see all other Google devices.
> 
> Best regards,
> Krzysztof
> 
Google sold the device under it's Nexus brand. But it was built by
Samsung, not just it's SoC. It's codename is "manta". Google places it 
in the Samsung directory instead of their own.
See: https://android.googlesource.com/device/samsung/manta/
It is a Samsung board, but also a Google device.

Best regards,
Lukas Timmermann
