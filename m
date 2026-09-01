Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D25399365;
	Tue,  1 Sep 2026 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273135; cv=none; b=summM4qoKHFOFM4agMT7IiwkP75oMXwzPxN9Ru+8hGEBTOj5Uknh4KsKx6PJbbjgsVX/nO068tJrKsR+/t+lBo4dxOR0xH4ejcEkXX3MlBqUmuwb/uP0RKiV2IufMgfNcL+x05yF2TGIgc01ydt1+8xlkgViF3wd3rdp/m5xLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273135; c=relaxed/simple;
	bh=rVo4fPvk+EyqhUA5LctQnzQE/OeYuIot+2bi0nSxymE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9mpqOAYNb+vXp1iVmkNJimhUc06Z/1aCxrmgqUJN/fyuzBHT2RzJjRGzqO3eYIjsY+QalouDw8fwy4uNuNVjqnQEqvDxopSnn1y5rUZ/q1kilMnr6mDNWUHdupAtpFogBQRZzL7fWwq0PdjtLIBcVXgQNMqq4542cU0VayUWrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fEQVswwu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fEQVswwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675EE1F000E9;
	Tue,  1 Sep 2026 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788273133;
	bh=laM40tiNuQEeSHrXuWhjVUDT6uySMsBpFfN2o9Zk9dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fEQVswwu6lBpxvhWFNE4HZhJgN1RjavpULlpN0pVrJFGsNWGjlyCg2hlkB1fYYaC9
	 UaNu+LUwaCi4i+/Y47aJ3EMBq0PJS+VhdtonxqLcRWwUJOfGadio2Bt4N6Qj5JHl65
	 LEOk8wGfsR1BtmiCb2V5NCQxcmcqsOeEuNQeJoq8=
Date: Tue, 1 Sep 2026 16:32:09 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>,
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>,
	"tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: google: Initialise probe properties with
 DWC3_DEFAULT_PROPERTIES
Message-ID: <2026090102-sponge-enjoyably-89f6@gregkh>
References: <20260819182158.1351869-1-radhey.shyam.pandey@amd.com>
 <ao404zOD-rXKZ84C@vbox>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao404zOD-rXKZ84C@vbox>

On Wed, Aug 26, 2026 at 12:36:29AM +0000, Thinh Nguyen wrote:
> On Wed, Aug 19, 2026, Radhey Shyam Pandey wrote:
> > dwc3_google_probe() zero initialises struct dwc3_probe_data and never
> > assigns its properties member. The unspecified state of gsbuscfg0_reqinfo
> > is encoded as DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED (0xffffffff), not as
> > zero, so dwc3_get_software_properties() reads the zeroed field as a value
> > the glue explicitly requested:
> > 
> > 	if (properties->gsbuscfg0_reqinfo !=
> > 	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
> > 		dwc->gsbuscfg0_reqinfo = properties->gsbuscfg0_reqinfo;
> > 		return;
> > 	}
> > 
> > Two things follow. dwc3_config_soc_bus() programs GSBUSCFG0.REQINFO with
> > zero on hardware that never asked for it, and the early return skips the
> > walk over the parent devices, so a swnode or device tree supplied
> > snps,gsbuscfg0-reqinfo would be ignored.
> > 
> > Assign DWC3_DEFAULT_PROPERTIES so the unset fields carry their unspecified
> > sentinels and the controller is left alone.
> > 
> > Fixes: 8995a37371bf ("usb: dwc3: Add Google Tensor SoC DWC3 glue driver")
> 
> Does this need Cc stable?

I'll add it, thanks.
