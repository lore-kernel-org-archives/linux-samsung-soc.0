From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 06 Oct 2014 17:38:09 +0300
Message-ID: <2733435.m6m6ahdT9t@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <2238934.uLuAbtBXFj@avalon> <20140923144937.GG5982@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140923144937.GG5982@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

On Tuesday 23 September 2014 16:49:38 Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 02:52:24PM +0300, Laurent Pinchart wrote:
> > On Tuesday 23 September 2014 13:47:40 Andrzej Hajda wrote:
> >> On 09/23/2014 01:23 PM, Laurent Pinchart wrote:
> [...]
> 
> >>> This becomes an issue even on Linux when considering video-related
> >>> devices that can be part of either a capture pipeline or a display
> >>> pipeline. If the link always goes in the data flow direction, then it
> >>> will be easy to locate the downstream device (bridge or panel) from
> >>> the display controller driver, but it would be much more difficult to
> >>> locate the same device from a camera driver as all of a sudden the
> >>> device would become an upstream device.
> >> 
> >> Why?
> >> 
> >> If you have graph:
> >> sensor --> camera
> >> 
> >> Then camera register itself in some framework as a destination device
> >> and sensor looks in this framework for the device identified by remote
> >> endpoint. Then sensor tells camera it is connected to it and voila.
> > 
> > Except that both kernelspace and userspace deal with cameras the other way
> > around, the master device is the camera receiver, not the camera sensor.
> > DRM is architected the same way, with the component that performs DMA
> > operations being the master device.
> 
> I don't see what's wrong with having the camera reference the sensor by
> phandle instead. That's much more natural in my opinion.

The problem, as explained by Tomi in a more recent e-mail (let's thus discuss 
the issue there) is that making the phandles pointing outwards from the CPU 
point of view stops working when the same chip or IP core can be used in both 
a camera and a display pipeline (and we have real use cases for that), or when 
the CPU isn't involved at all in the pipeline.

-- 
Regards,

Laurent Pinchart
