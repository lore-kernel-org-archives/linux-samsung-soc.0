Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DE314B71
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Nov 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252122; cv=none; b=cKZ5+l7vnld548ZNQ2kHGd8Q670kdHbPfvOnE+u+2g3OW/+74Mwc9gNOeG/DCQ098hyigRVRV+T/kWUMDbwxBtWe5w/ebI1ucfXCda65sTvZcG4lHXNdtHS/9ttMu7yQV6xX9SFFZvH9hj8DkB0PHDNR7Y4Cb0oCvkMRszgURSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252122; c=relaxed/simple;
	bh=05d5E9MY0aI85s5xlVR3wKl/xBD93gHT2h1F52y2vC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMlMI71fTsq6iiUB3At80JN/f4vlgKYJQZpt8y4Eee7WBqjREfS5Mapsp7Cuw8X6EgM4IlI0nbsaqY9t9AHzBHV/O/ku8yGXGc7z6SylSJS81RIKatMqcvSNNsxfdkh6OxnsV25vPhICm1jO3T4bCRqwPedqwEsKWG1S3eQCeoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyc3oTic; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyc3oTic"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b98e6ff90cbso2133819a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 02:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762252120; x=1762856920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=;
        b=lyc3oTicnUvduLEcq+ir6xs9w9OIk5mbU6FHdgZyVUZPYbW8L+u4HZv7rS7pJjDRnl
         rHdbgv6zE7uxJ//IVZozB/2yZEHA70BiVpcw+UvMeNIeqniaf3rY6y2EFNf5FnfDlBPh
         hmJneagOHzwkxT5+hk6hBjqvvLTndk6RBElWMUV8TbXoiYXJuhBjQv3F9hQ+Rb0esHKC
         +kbsJrnrUU9jN0Q3+jnxxl+NSqlE7kbPdwPn6ytRIp0dkljC9AuLDBMJurpRzeTBgK8d
         hPA3aS3jJ4zv41LZ8hrcgX7GeR6Ig9dq6tjWVomsZSg9BPHSjm6aPcepDHrAeT8kbuzW
         /EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252120; x=1762856920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=;
        b=WqS5wvgxhsERrwJhLa3ihNXAU7wqfZVS7QYfL0BN6wtbBYpvhKM3BPd+9bliD3fh5q
         O22bddJtVgzXHMvOwl3pQdLkfnS7KLZ4uvBO8xMalQ0Dm7+6AXhcczhAYx9BDw1d1xbx
         TGyin/r9wcui0yGflMSXIw5Lu+tW1lcRcIKXvVeqxoQ5dGETv0vQQtjj+9HYIX6eUb/d
         SfsYhWj/BnOP6coYIsfmlWZ9Q5f7pcsP7x4tjESB0H1WguDfmSVALXPfYVunIRMp9BBo
         AdSBlNgdIESxiI5DnCf/daoou7460w4ft5JqdAayTN6aB24H/eRC7i39wnpN+0vH6+ch
         ZNIg==
X-Forwarded-Encrypted: i=1; AJvYcCUXOZN2VH+3qLyO1EJOkAoNU9w3cllpofbm868cktiMlo/BGbNJM35nn7DIAWGZHjsMlXBBa8eJBAhbaR2BjBBUrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHutPRnjQvkr6PARa6ed/Dm7DbePlEHVpao2vNcF9JOiM4ZrO
	sFkzXdd8UGZBXJBLpdmDBii6wAoe18DAa+3vsT0AN1lRGwn0ixCQFdQAveEhT2bwhQhfBVIN0w3
	m2cxe70pwK79ZmsH6HIb8X3q6t7OuZ6ZjOTNqbeoW
X-Gm-Gg: ASbGncs5EBpYOqhk7ad8KedBlwJLV+cCHqqxOOMl3IRX1VTz/VookwZ8JzGfjOFQwus
	Emnq/4RUnJVuudf9Y0OI8QzcDc1ekRHXdCnSWPlxQ73vg3cdUJ42kcWj3seDt4mLQylCys/TFsi
	eXHNC7cH2swn2ULrWtZPg6dhE7guNR/vc7Ofmyxs4o7sQkfpbf1/Si31w7T738bBC1QUemUvhvN
	N88QZhPXXx75cijHBxGVmWeCW/JSAR9x5qa2Tpkp3iPEQehb14v2Y26DskCVyompzHJ83w=
X-Google-Smtp-Source: AGHT+IFtWCITnsqCpapCWEO1jfYZL/VVdrKbyDrZUYMRozSaaP1/me7PX/YPZoiJBaJe87Ul4D28jeHU7OTgnpSDtH8=
X-Received: by 2002:a05:6a20:549d:b0:341:5d9f:8007 with SMTP id
 adf61e73a8af0-348cd21b580mr22355749637.57.1762252119315; Tue, 04 Nov 2025
 02:28:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <2025110128-jailhouse-situated-22b1@gregkh>
In-Reply-To: <2025110128-jailhouse-situated-22b1@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 4 Nov 2025 18:28:02 +0800
X-Gm-Features: AWmQ_bnRE9DIQMXPkKDyyG2DDLmVc1ZLrXHYPMXtrjkVwdpu0f_b01Bk7DLUsug
Message-ID: <CA+zupgwOx5hADbHC8LbxkcsFBfgWyssqnRgE+YXy0umZmj6XNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 2:10=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 31, 2025 at 05:49:28PM -0700, Roy Luo wrote:
> > > > +         dr_role !=3D DWC3_GCTL_PRTCAP_HOST) {
> > > > +             dev_warn(google->dev, "spurious pme irq %d, hibernati=
on %d, dr_role %u\n",
> > > > +                      irq, google->is_hibernation, dr_role);
> > >
> > > Should we limit this print and do we need this to be dev_warn? It may=
 be
> > > noisy wouldn't it.
> >
> > Ack, will make it WARN_ONCE in the next version.
>
> So you really want to panic your system if this happens (remember, the
> HUGE majority of Linux systems run with panic-on-warn enabled)?
>
> Please do not, handle the issue, dump a message to the log if you really
> need to, and move on, don't crash.
>
> thanks,
>
> greg k-h

Thanks for pointing this out, I overlooked the panic-on-warn scenario.
This case is actually very rare, I haven't seen this on the field and I
feel it does no harm to the system even it it were to happen, having a
debug log should still be useful if we were to debug anything specific
to this interrupt. I will make it dev_dbg.

Thanks,
Roy Luo
