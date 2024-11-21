Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A371D7E5B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732192499; cv=none; b=eipoP7nlv3yNq5i2+sCaxMOFwIhfZ+cipebJ4iosblg5+oSr6Ky1xFajRaolbcmRPjcK1WmOLg8/3SQvEJnHGBMJE9O5gL1ezrtRGEZ1xJNOPy5nB9RQLlupojDkHhOsCosF0Xecy++pfPhPDFMjU3TwkyKBxOTvMYzKdKUk12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732192499; c=relaxed/simple;
	bh=LOF0ZGMzohFWkxs3N4CWYuk4rQoAdNGRuRsjFSQbJJI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PC366P4+EkZzZHYJUyHlziVMkU106yAIGGjLXzy1ByWiOw62bZIDf+y9gGBgazpFLE9zl1vY0tmn5gjnq2evvISjT0KTVDSSmWCCMTFVak38nhv6dky+sEHdgRagX55dvlD0e9Neslv0GLXep9UYJOUSVLCZfcigiyQxQTCmtOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kaSRsxYB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kaSRsxYB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431481433bdso6984375e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 04:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732192495; x=1732797295; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N/i4tvHGx2FYMnx6MN0glfmLiCkgFZoABcJtB1Szxd8=;
        b=kaSRsxYBJYKxGtNM3Qnf7pzbUeoRaoXXhXe35EvwZr63gzMFmUU5/2IZqVjX0belGM
         HgpgYwhOD0aBd6KFtw/+TYMsgOy146Fll+0ZVPPJREv/QvZFYx/IdZow83aQ4hkCavV9
         uvFfc1qIpI+QkP3pko2454jdHuPHbLHvuaG6gSGSfqaT5U0hCWwqAhViYI2iU/xQppIS
         Y4VigVK9gtkh99km8Uw049I2M6cgPPjbCZKCEhFrotN/rvI7csek75ovA8ifVIdXuMtA
         92wnAwgCFjDjEyLtMtPNuziHurQkkWSGOT2zaFplJbIWfNJnI5tlRXZHc92+gQOm2dff
         rwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732192495; x=1732797295;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/i4tvHGx2FYMnx6MN0glfmLiCkgFZoABcJtB1Szxd8=;
        b=iVBE3DCYKlSeR5czolFeUpaQOPdoYWbRLm5p+H0tICrU2lCdT2hwlSDUbMhCLG1vs/
         zB9YHyTkrtE/opvmgQ8JNzPTsKQPon7JrwASSHsaiDmwI0WKkq58Te9kevwdMkQ0lMoy
         0ShbbYMsP5H1OR5QLRpz3MrMAvENY53ZN7hykTFSXbZlWBu2/ZZZGs/eIu+JZr7UsYQp
         mYwuGPxUJmfheP9e3XPIk+sEo8KaB6zBo2vecLf1uEaQQC6eixJOrenlMcrV0/l/uLmx
         QRvkcYFAFk/tFq+XfNFXoEzLHeriCMqIgCm+1nZoduDxb1LRRZLtrW6UYa6+ep28BukD
         Bg9A==
X-Forwarded-Encrypted: i=1; AJvYcCXAAfrANyGqhUBXdT1Ov9etr0OTDC/N3H/1rp1hjdraCpSftsiYbfw4hq7zWn6sJ54cOWXjO4sbjRmQAxumFv2IJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Rel4o1PYrdiB+r2658ChbKOZPIwKjIA+qUp5phB174rSeKs3
	jl2N6U8sJQir2pnSh4hrVDb1rBOAQ9aeQkGtTBCG9Rz6lMTgt3+g7e75SfqxUNU=
X-Google-Smtp-Source: AGHT+IFKlGke7cTqcSCgSUal86CNdFGn/WCgyq25tQWYbY4OKP14AHFYRZyz5c+vckzc0fE8jbFfiA==
X-Received: by 2002:a05:600c:35d0:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-433489d32acmr63605165e9.15.1732192495564;
        Thu, 21 Nov 2024 04:34:55 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254905396sm4906626f8f.15.2024.11.21.04.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 04:34:55 -0800 (PST)
Message-ID: <a40ac04beb4501ad95b50f79be3495315e38a880.camel@linaro.org>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Peter
 Griffin <peter.griffin@linaro.org>, "kernel-team@android.com"
 <kernel-team@android.com>,  linux-samsung-soc@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>
Date: Thu, 21 Nov 2024 12:34:54 +0000
In-Reply-To: <20240813230625.jgkatqstyhcmpezv@synopsys.com>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
	 <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
	 <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
	 <20240813230625.jgkatqstyhcmpezv@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thinh,

I'm only getting back to this now.

Thank you for your insights, they were very helpful!

I've added linux-samsung-soc@ as remaining issues might be specific to
Exynos, see below.

On Tue, 2024-08-13 at 23:06 +0000, Thinh Nguyen wrote:
> On Mon, Aug 12, 2024, Andr=C3=A9 Draszik wrote:
> > Hi Thinh,
> >=20
> > On Fri, 2024-08-09 at 23:10 +0000, Thinh Nguyen wrote:
> > > On Fri, Aug 09, 2024, Andr=C3=A9 Draszik wrote:
> > >=20
> > > > Which part of the stack should be responsible / the entry point for
> > > > triggering
> > > > the dequeuing?
> > >=20
> > > When there's a disconnect, the UDC driver will notify the gadget
> > > driver
> > > via the gadget driver's disconnect() callback. The gadget driver is
> > > supposed to do the teardown and cleanup. This includes disabling
> > > active
> > > endpoints. If the gadget driver disables the endpoint, then all the
> > > active requests will be returned properly. Check documentation on
> > > usb_ep_disable() for more info.
> >=20
> > Thank you Thinh for that.
> >=20
> > I think the problem I'm having is that nothing is actually detecting
> > the disconnect. Based on the above, I believe I should get a
> > dwc3_gadget_interrupt() with event->type =3D=3D DWC3_DEVICE_EVENT_DISCO=
NNECT
> > as the entry point for the disconnect sequence?
>=20
> Ok.
>=20
> >=20
> > This doesn't happen, I just get one interrupt and there is just one
> > event with type =3D=3D 6 (DWC3_DEVICE_EVENT_SUSPEND), see attached trac=
e.
> >=20
> > In this trace, I've configured a network interface using CDC_ECM, and
> > then
> > am disconnecting the USB cable @ ~158
> >=20
> > Any idea what could be the reason? For testing, I've also added
> >=20
> > 	snps,dis-u1-entry-quirk;
> > 	snps,dis-u2-entry-quirk;
>=20
> You're limitting the gadget driver to operate in usb2 speed, so
> disabling U1/U2 won't do anything.
>=20
> > 	snps,usb2-gadget-lpm-disable;
> >=20
> > to my DT, but that doesn't seem to make a difference.
> >=20
> > >=20
> >=20
>=20
> If you don't see a disconnect event, check your connector. Check the
> logic for vbus detection of your connector and see why it did not clear
> the vbusvalid signal properly on disconnect. Looks like you're using
> UTMI, check your utmisrp_bvalid or utmiotg_vbusvalid signal on
> disconnect.

I'm a little bit further, thanks to your pointers Thinh.

So in my case, vbus is not connected to the DWC3 (or phy) directly. It look=
s
like we can trigger a few signals via certain bits in the phy, though:

UTMICTRL register:
force_vbusvalid [5] RW Overriding vbusvalid signal
force_bvalid    [4] RW Overriding bvalid signal

HSPCTRL register:
VBUSVLDEXTSEL [13] RW External VBUS valid select
VBUSVLDEXT    [12] RW External VBUS valid indicator

To make things work at all, the Exynos phy driver forces all 4 to be enable=
d
during init.

If I clear three of them (force_bvalid force_vbusvalid VBUSVLDEXT) on USB
cable disconnect, I observe the expected DWC3_DEVICE_EVENT_DISCONNECT
interrupt, and the stack shuts everything down. So far so good.

Unfortunately, this only works once: After restoring those bits and
reconnecting the cable, USB comes up as expected, but a subsequent
disconnect with the same sequence as during the first disconnect doesn't
trigger the DWC3_DEVICE_EVENT_DISCONNECT event anymore (others still happen=
,
like DWC3_DEVICE_EVENT_SUSPEND).

Kinda looks to me like either I'm still missing something, or e.g. the even=
t
is somehow masked.

I anybody aware of anything related by any chance?


Thanks!
Andre

