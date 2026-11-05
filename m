Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886236;
	b=wz90qxoRclZNFU6RzOereSJ+8DTKuByzXpTkLAe19Kwln5oUAnU1yvgnKwjfDGhRzSqW
	 QmA/jj0R/WSIAjYgvRYkvaZSZbuV7IQIJDeu9+a/pLxhWQNM5a4r1AV3D4MmE2gDlT4yj
	 G5L00iISHOKdLGLo4TCmdXrDQu5li4OIs4ku5+nI7ZGb8NeUu4gSuX02H4S1r6LejPN94
	 oB2ou0AQTn3yYT0QVUny9QpXNEeiH4Rpc4pQep4eBTerG4PBYGbxHEYivFfm6qOnRRLLw
	 qdi3ULZTXQDddiENF8qeDMb2Npb3f9hsFvFrWAq/TR+SUSM74mNY9edVQonRAMnUyrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886236;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=WihdVhfWiVZyEO0bw8NjJktB8gYP5aXx2PNqCwicMCU=;
	b=VqJiBLv8KVbOC254ePfiu1Yj6BJ+Df6N1KPNbSyQyRFBedNEkclrB2uXM+uwmqHHjEnt
	 ice5eY2x6Z3AtfAqUNymxr34cLcP5FSLVl/kRC/i6pMo8n0i4t5eFUdJPfeUM6wzhq7Yi
	 KxKZ4vuWvjdGuvT8SLyz98k6QOpTybXrZElKCbJzmYRcNFPSSpjOEOi61h/KIFkwAbqah
	 u3+hUnDFOnoHJUmq01zAmujoo5UTSfrhI1NFOTCIbI9SfIXrbdy5xFCwgcfYkEfoS0fyQ
	 kHpeBUGm7W6LxjCu6TwVdVSgdW3wloS4aV4Uird+fuuFDqGmmrl0sjOA9/MlrfVwXQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=d2r6OZNt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yvvnEW0C;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B9606A329
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 13:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6B9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=d2r6OZNt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yvvnEW0C
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 005D51D00115
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 08:43:54 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 08:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793886225;
	 x=1793972625; bh=WihdVhfWiVZyEO0bw8NjJktB8gYP5aXx2PNqCwicMCU=; b=
	d2r6OZNtCKlI7kXBnOkOZKyHYfrb/OgsmFZt3xAfKLw73OXjkOei1pAA2aj2mHEk
	MX1NFeAq9q7AKLpFoVTUHoxxy9ZMOxlBac9XEU3O39+qOK9X+R6K9ZFbNaOnqSl4
	lgJiKO/hphkfwlaROi8dFRxbL3vDn4m4qJzvCbPDKZOILfH1HRcS7z4B23BwrVpT
	iduyJCDYT0nnyM6yvpx92RpBDoZhJVU7hOWIWjI8E6m9ep+tnaKbtOCGzOalTLDK
	8zr9iWPCL5oNZwbPwo0IoMAhz8IKCsU0J/lVGZ/NltI+LtDl4KjQUyMy9xZLit1J
	MfSdpT4Q/2T6k74+yXElLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793886225; x=
	1793972625; bh=WihdVhfWiVZyEO0bw8NjJktB8gYP5aXx2PNqCwicMCU=; b=y
	vvnEW0CjfssfhweEzmh6WsdX4fARbwfp90gpoeQ9xEKvP6hkujihfeX75PIecfG1
	xdGrEEPw8nxzwgBZvlQ6UqXWDAMFsi5wGNq/6wAO+zBeYE/yie7PkrSi0tmt/FCw
	ZMWf8wUgPDdFJcEBeU5LMjJFN07ZR3C7d9JVdK5aX3XY0iVFwdIZwNSr/yuW0fDw
	az72MqdJwKP3kXXQKsCWrljoxLRkwkUkHoSNb4B6XLkntQhF6ri9Ap4g0fYlpZw/
	CttBWlDNJ9QRhFozb/fZCQB/JGigqGQ0WUXFrKzoz4hIqzbQfhSMJgKnOuLHrmjo
	24bgopYdRLv+mZLzcLJmw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793886225; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:kXRcbhZlIlZwyoXiaTVlbVZmOO9LNgxLBM0EoxxGKaURrzB
	DmI8Uo0A13OosVgRTOtsbaxg8mwurbqVxuADL80YQ+3RP93QYS1+/H45hhQIP7Hk
	lXP5o0xIpzq2gQLpmsN5kao+frqIW6IsCHPZz6pbHpfFOjim3Kgo3re4px01yngt
	hdqO2I1KQzZAP+doRuYaduq552Q32CiWM8vznLo/WmZOQXRX3yCfpgdKfdl3Z22n
	7ueinbKZi5mui1O0xu9BBtbNYxHmYPjQ8rhVR1F2I0p0MzY1OCvzD8cGw6XcOCHk
	4eA1XOzTnvchPzCJh1CGoUwwNYK4yLsvoOqAdBQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:usFYFeHGT2O8pJFjYF7yzTkw5w0HP3Akcfkbg+r1ZOE=:/X+gauo9kedkkd8OD+RczGr1rovGGPIS7J9gta2PFKQ=;
X-ME-Sender: <xms:C4jsahzIHY5sGbnHhNXP7hc6vEYoGBoXUBAKYOlom8w-rOtf1Qo3jA>
    <xme:C4jsasEv1uGCfcMKMQHhx_1NnTFPS4QfrwTnkIKFfvCLKw6jPjAWK4E0xp_vuDI8E
    e9mxnlKN3bgUw9yVO9Ij7Jxz1IPkalN563ItoPYBsr4uBNiJ8XSj1UL>
X-ME-Proxy-Cause: dmFkZTEbJ1HCMD7HKQdn+Je5+qfzeasdYHRVgHBDJ2leB0E+P5/E6P4UvqCmTpD3dFPpZB
    zwqQPQpO0QWSYh0B3ExbqZ2sCzyoakzDestx6zHERhHNwxDvpzVdJc1a2mK8NFXj1j7Hn4
    hL354jfLArXZwa+EVniesFLTwbdVQyW4eteFFeogDstyeY76QDgvYCbKgHzIuRfr0VCGrx
    ADTWWvLUOZMg5rVK2VbT7TWTFU58SgYYRo4pT4n+Sr3hJ7dUZvXM/2nMnpJftZJTwby6cD
    dnJvB37dma1nC/hBJQlLLIL39P2YNcFR/XUm4O9WYIvPktWi92ERT+RkiD4g4sIOWce+Am
    UutJVlN3RGQMq4i1RraG2H5duA3jwNlkmc/qtrEav48tRbJAyO/oCCQaN0qr9Dn5A4JS08
    kfd/Xicw+jBNy5YeOFzyh0ifHr9dZ4u7FBmrw3+jHUbwpOlhfoGnQvw8yn7IzwmfhpRs9d
    WOFCxC0FKZxSxvGfTr14BzRyfcHXgQ5uqXTCV1mWRaK1UqrlqoNhnvtSZIxoU8/ms8n8ky
    QBifRPsuvWYpG5hsQZ0/NxErpTI8DKRGEiApyTEPCvMrX7K/hbiSj/DmGLJdc32HZ9UVYh
    zHrWxFCiEQa0h8X84doeG4tI3wRP1tT6SUk78yQLL0uNKJ0PYC4DIahgXkGg
X-ME-Proxy: <xmx:DYjsanVomOSlqvBgSRk0vTNavKF2Hv-PuVnRSz9hpe5CF1w1wphuCQ>
    <xmx:DYjsao_j_9XnI4IWeMib6F2X3f80bZMNBy4Mc65nNJ152Nk0lS1bYw>
    <xmx:DYjsar6bOZ7MjulBUnD1ddZQu-z2IAqEOiSK19_YN9nGwBYzPmtDBQ>
    <xmx:DYjsah2C1LP2Uei3y98aefUtjtopJRoIVAY8697mqfGTPnOhCWOTJA>
    <xmx:EYjsan2nH0fVusSh_MWZN7VMLVrfUmhofpGOVVJPGrQo6OwfA20FnKiM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 36D2C32A0097; Thu,  5 Nov 2026 08:43:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A58_iQTPKAxw
Date: Thu, 05 Nov 2026 14:43:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Russell King" <linux@armlinux.org.uk>, "Mark Brown" <broonie@kernel.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Message-Id: <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
In-Reply-To: <20261105085321.GG1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 09:53, Lee Jones wrote:
> On Wed, 04 Nov 2026, Dmitry Torokhov wrote:

>> On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
>> > On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
>> > > +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
>> > > +			      const struct mfd_cell *cells, int num_cells)
>> > > +{
>> > > +	struct wm831x_pdata *pdata = &wm831x->pdata;
>> > > +	int i;
>> > > +
>> > > +	struct mfd_cell *local_cells __free(kfree) =
>> > > +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
>> > > +	if (!local_cells)
>> > > +		return -ENOMEM;
>> > > +
>> > > +	for (i = 0; i < num_cells; i++) {
>> > > +		struct mfd_cell *cell = &local_cells[i];
>> > > +
>> > > +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
>> > > +			int id = cell->id - 1;
>> > > +
>> > > +			if (id >= 0 && id < WM831X_MAX_DCDC)
>> > > +				cell->swnode = pdata->dcdc_swnodes[id];
>> > > +		}
>> > > +	}
>> >
>> > I can't begin to tell you how much I hate this.
>> >
>> > Why are we duplicating massive static const structs just to add a S/W
>> > node?  Is there no other way we can do this statically?
>> 
>> The software node itself is defined statically in the board file
>> (crag_dcdc1_swnode in arch/arm/mach-s3c/mach-crag6410.c in patch 2/4),
>> as it describes board-specific and PMIC-instance-specific wiring -
>> specifically the host SoC GPIO wired to the PMIC's DVS pin (GPK(0) on
>> Cragganmore 6410).
>> 
>> Because wm831x-core.c is a generic PMIC driver that can be instantiated
>> on different boards or even multiple times on the same board (for
>> example, Cragganmore 6410 has two WM831x PMIC instances, only one of
>> which has a DVS GPIO wired to DCDC1), the shared static mfd_cell arrays
>> in wm831x-core.c cannot point to a board's software node at compile
>> time.

I think realistically this driver is not being shared across boards
and the documented but unused DT binding in
Documentation/devicetree/bindings/mfd/wm831x.txt does not describe
the gpio or actually match what the driver does.

I'm still not sure what your goal is with this series, but I feel
like there is no point in over-designing something that is not
going to matter anyway and that would be replaced with a different
DT binding if any new users should show up.

Why can't we just put the gpio property in the wm831x node itself
for simplicity?

>> In v2 of this series I actually tried passing the software_node pointer
>> through wm831x_buckv_pdata and attaching it to &pdev->dev inside the
>> regulator driver's probe() [1]. However, attaching a software node to
>> an already-registered platform device inside probe() is awkward and
>> requires manual teardown in the child driver, whereas mfd-core already
>> has built-in support for cell->swnode in mfd_add_device() (attaching
>> the node via device_add_software_node() before platform_device_add(),
>> and cleaning it up via device_remove_software_node() on error or
>> removal). Populating cell->swnode lets mfd-core manage the software
>> node lifecycle cleanly and keeps the regulator driver untouched.
>
> Why do you need to attach the software_node to &pdev->dev at all?
>
> All of the other DVS configuration (dvs_control_src, dvs_init_state) is
> already passed to wm831x_buckv_dvs_init() via pdata.  If you put the
> software node pointer in 'wm831x_buckv_pdata' (with the rest of the DVS
> parameters, where it belongs), wm831x_buckv_dvs_init() can simply use
> devm_fwnode_gpiod_get() to fetch it.
>
> This then requires no device_add_software_node(), no manual tear-down in
> the regulator driver and no "middle-man" changes to MFD at all.

I like this better than Dmitry's version, but it still feels like
adding complexity without a clear direction of how this should be
done for a complete driver.

> +
> +static const struct software_node crag_dcdc1_swnode = {
> +	.name = "wm831x-buckv-dcdc1",
> +	.properties = crag_dcdc1_properties,
> +};

specifically, this still adds a swnode with properties that don't
match either the documented binding or a potentially better one,
it's just another ad-hoc way of passing the gpio line.

> @@ -341,8 +344,15 @@ static void wm831x_buckv_dvs_init(struct 
> platform_device *pdev,
>  	*/
>  	dcdc->dvs_gpio_state = pdata->dvs_init_state;
> 
> -	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
> -			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
> +	flags = dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +	if (pdata->swnode) {
> +		fwnode = software_node_fwnode(pdata->swnode);
> +		dcdc->dvs_gpiod = devm_fwnode_gpiod_get(&pdev->dev, fwnode,
> +						"dvs", flags, dcdc->name);
> +	} else {
> +		dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs", flags);
> +	}
> +

and this now has two ways of getting the gpio line, only one of which is
actually used, and neither of them matches the DT binding.

Instead of the piecemeal conversion, I'd prefer if we could either
do the entire wm831x driver properly or only do the absolute minimum:

- if there is a reason to expect any future user of the driver,
  extend the wlf,arizona.yaml binding to cover wm831x as well,
  replace all the platform data with swnode properties according
  to that binding and have the drivers use those.

- If crag6410 is the only thing that is ever going to use
  any of it, stop worrying about doing it cleanly. We can probably
  just stick a gpio_desc pointer in the platform_data and be
  done with removing the lookup table.

As far as I understand the situation, wm831x was used on the
reference board (Samsung smdk6410, removed in 2019) in addition
to crag6410 but never anywhere else upstream. The question
then is whether we'll ever see a DT conversion of crag6410.
This would require finding someone willing to actually do
the work, and coming up with a way to handle the autodetection
in mach-crag6410-module.c so the correct spi/i2c codec
child devices are probed.

      Arnd
