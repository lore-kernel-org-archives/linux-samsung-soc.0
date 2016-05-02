From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3] media: vb2-dma-contig: configure DMA max segment size
 properly
Date: Mon, 2 May 2016 16:14:04 +0300
Message-ID: <20160502131403.GJ26360@valkosipuli.retiisi.org.uk>
References: <57271235.9030004@xs4all.nl>
 <1462186753-4177-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462186753-4177-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 02, 2016 at 12:59:13PM +0200, Marek Szyprowski wrote:
> This patch lets vb2-dma-contig memory allocator to configure DMA max
> segment size properly for the client device. Setting it is needed to let
> DMA-mapping subsystem to create a single, contiguous mapping in DMA
> address space. This is essential for all devices, which use dma-contig
> videobuf2 memory allocator and shared buffers (in USERPTR or DMAbuf modes
> of operations).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
