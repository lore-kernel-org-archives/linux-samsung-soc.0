Return-Path: <SRS0=b7Q7=D5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063DDC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 11:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DAC0222E9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Oct 2020 11:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W2W63+Km"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897503AbgJVLns (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Oct 2020 07:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897497AbgJVLnr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 07:43:47 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9B4C0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2020 04:43:47 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id t6so659729qvz.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2020 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tn5VStmyr19eg0AHWkg65WyZIMHvKO6plAVuAqOgPDQ=;
        b=W2W63+Km46WNPYtkSR3igfnV7TEUq5madmsiNOsLljJ4hXhwY+tNpYNU0U98RMc/Ra
         N/OqT1bclh4ytLL1rVRfHDNQXuCClycUHEstVDTB13O2SeX7rcenP16ZDtQZwB1W1jcc
         qY+V9dfylqzLN5PiDQabSjcYMeIPMV8H3MvDBIvqP9uVDzx0l3+DGSbt51z70fKAGBps
         MOgHN8p+THySDXKSzKDRAxFER+JAglmr7hGRyvf9N5t7jpnIarxCymOKiSFfwhwoQKR+
         3E88SiMtx1h9HdY+LUkd3T5LmcI1LTVNdrFdFYFYlKXO0Wntp7OMh6vxttQFR1tsYI0Q
         kJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tn5VStmyr19eg0AHWkg65WyZIMHvKO6plAVuAqOgPDQ=;
        b=VuE5EL+hVdK+9TmMXqBkuiJPNI/fLnqdH9SrCWq8mloPnnaJ7RrmQOE+Mo0rPnHIe7
         2OBL7byW0Ngjmt3CgIMYXAAJcLhD2vpmJdrc3zfxHO172BkQAFIFvHurduCE/ys1DrmY
         yZGHyRdkCNEjm2Q1zK/kWEa5HF2SA7AzTNk2OOW+VzapZbGsx6T/LN0bxUSQUYFzoUYQ
         vIc7EX922l5EYczzCi5NTUP3YHhZeCgJtzduDL3y/4JFi/oy2cfDJBfHrYWuLckOvGO8
         enVh1ceSf0XaGinXfHvjGsaYvVNHzSWL7zLQSL4YyeMQL5NUcihjKIbKS/P0wL5Dc/Eu
         ysRw==
X-Gm-Message-State: AOAM532ewJZQVoyz8pr19ohKbVyqOCs9ZL8+ndvjRIVdiwuN/fubiS0w
        CYhQ0XWjCVR1PvaIk8r8F2CNGg==
X-Google-Smtp-Source: ABdhPJw6OYYGIWsKIpwZGlvXqWx4K8ij3H0LBJb/eEFtxBXIO8uo2emBiN1PSKDxC0xVD0g026FmxA==
X-Received: by 2002:ad4:45a5:: with SMTP id y5mr1935405qvu.40.1603367026713;
        Thu, 22 Oct 2020 04:43:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id l25sm820821qtf.18.2020.10.22.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 04:43:45 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kVZ0T-0040bW-1W; Thu, 22 Oct 2020 08:43:45 -0300
Date:   Thu, 22 Oct 2020 08:43:45 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201022114345.GO36674@ziepe.ca>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca>
 <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
 <20201021163702.GM36674@ziepe.ca>
 <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
 <20201021232022.GN36674@ziepe.ca>
 <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 22, 2020 at 09:00:44AM +0200, Daniel Vetter wrote:
> On Thu, Oct 22, 2020 at 1:20 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 21, 2020 at 09:24:08PM +0200, Daniel Vetter wrote:
> > > On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
> > > >
> > > > > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > > > > split that. So ideally ->mmap would never set up any ptes.
> > > >
> > > > /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
> > > >
> > > > pgoff doesn't get touched for MAP_SHARED either, so there are other
> > > > users that could work like this - eg anyone mmaping IO memory is
> > > > probably OK.
> > >
> > > I was more generally thinking for io_remap_pfn_users because of the
> > > mkwrite use-case we might have in fbdev emulation in drm.
> >
> > You have a use case for MAP_PRIVATE and io_remap_pfn_range()??
> 
> Uh no :-)

So it is fine, the pgoff mangling only happens for MAP_PRIVATE

Jason
