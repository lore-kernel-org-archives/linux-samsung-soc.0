Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A0332909;
	Fri, 21 Nov 2025 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763748457; cv=none; b=Qxl4QmhGykbNsfAubZ75E3xFfWjvNWPOtuQ2pxqzxyGQtra3+sbCIo354rWPuYQtfxvlOU2zRLAxfQHm0OGUidhoq7oaHzKz3gjgEqTwHahCACPsxEE+5YwDDiMt6J5zw1n8A7YZOTmA+FSaZYfbDh2SigUeqVMK9/Zawz6+SFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763748457; c=relaxed/simple;
	bh=Ioxqv4KlEYcuNnaTZjV+Y5n9xgfyfs18TyUalExGjPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+6q+HNrHX8k/pYL5vG3iUbkTEd+4FBR0sZ8QzPhJmTiM7MQr3UbnLs0ChkpFFt6G1epHKDtlTRPVQ5NyuMMxO8r73w12j/BUIQVg8HwgsjqhvDoPUM0W0msozO0DgyAxdRy3PpQ72SrU4WzBTdvD6L+YuWcvjhjDaup8XbsUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dCjqH5JC5z9vB1;
	Fri, 21 Nov 2025 19:07:23 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Fri, 21 Nov 2025 19:07:20 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
Message-ID: <3phpqlnzbqoclx6zqkqymugzgazg3xtxrmvl3coflgos4ncwf4@ljo4zpgyp7vh>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
 <20251121-convivial-wren-of-wind-cefe21@kuoka>
 <zgyxb6jqfvfr6iah4lw7rvweextbwxrtlysap4dfzeejqgulwo@ik25opshvwxd>
 <a75675ef-dff6-4f97-854e-a007d289c45d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75675ef-dff6-4f97-854e-a007d289c45d@kernel.org>
X-Rspamd-Queue-Id: 4dCjqH5JC5z9vB1

On Fri, Nov 21, 2025 at 06:24:36PM +0100, Krzysztof Kozlowski wrote:
> On 21/11/2025 14:45, Lukas Timmermann wrote:
> > On Fri, Nov 21, 2025 at 10:04:43AM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
> >>> From: Alexandre Marquet <tb@a-marquet.fr>
> >>>
> >>> Add the Google Nexus 10 board to documentation.
> >>>
> >>> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> >>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> >>> ---
> >>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> index f8e20e602c20..97a5a678f43c 100644
> >>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> @@ -120,6 +120,7 @@ properties:
> >>>                - google,snow-rev5                # Google Snow Rev 5+
> >>>                - google,spring                   # Google Spring
> >>>                - insignal,arndale                # Insignal Arndale
> >>> +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)
> >>
> >> Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
> >> 100% sure that Samsung and Google are two different companies. Google
> >> products use only google prefixes, see all other Google devices.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > Google sold the device under it's Nexus brand. But it was built by
> > Samsung, not just it's SoC. It's codename is "manta". Google places it 
> > in the Samsung directory instead of their own.
> > See: https://android.googlesource.com/device/samsung/manta/
> > It is a Samsung board, but also a Google device.
> 
> As I said, all Google end-user made by Samsung have Google names, not
> Samsung. Do you see there samsung,spring? Or samsung,nexus for other
> Nexuses? No.
> 
> There is just no such thing as samsung,nexus. Never was, so you cannot
> use that as product.
> 
> Best regards,
> Krzysztof
> 
I compared some Pixel and Nexus devices and now understand what you
meant. So "google,manta" should be the correct name here?
As seen in "google,sargo" -> Google Pixel 3a
Thanks for your input.

Best regards,
Lukas Timmermann
